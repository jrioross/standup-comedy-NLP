# standup-comedy-NLP

## Table of Contents

- [Motivation](#Motivation)
- [Technologies](#Technologies)
- [Data Questions](#Data-Questions)
- [The Process (in which We Trust)](#The-Process-in-which-We-Trust)
- [Link to the Dashboard](#Link-to-the-Dashboard)

## Motivation

   I’ve always been interested in language as a craft. I studied theology, philosophy, and literature, and I write both essays and poetry. Attending to the intricacies of language is essential for systematic thinking, clear communication, and persuasive rhetoric. But this attention isn’t just reserved for written communication. Standup comedy turns the craft of language into a performance, a spoken art. And while I’ve not (yet) done standup comedy myself, the advent of streaming has made standup comedy more accessible than ever.

   How standup comedians craft their language and delivery varies dramatically, as do the actual topics that comedians address. Demetri Martin is well known for his strange and surprising one-liners, while Mike Birbiglia is a raconteur whose setups can be paragraphs long (albeit breadcrumbed with additional comedic content). Very often I want to recommend a comedian or show to someone because of their sense of humor and/or some characteristics of the comedian. By contrast, most algorithmic recommenders don't work that way; rather, they work on a “people who liked A also liked B” model. These models are certainly useful, but they are less weighted by similarity in comedic style than they are by era, sex, or race.

   I therefore wanted to develop a recommender that recommends standup comedians based upon having similar style features to a selected comedian. These style features will be primarily dependent upon the comedians’ topics spoken about and their use of language.

## Data Sources

  - [Scraps from the Loft](https://scrapsfromtheloft.com/stand-up-comedy-scripts/)
  - [IMDB-API](https://imdb-api.com)

## Data Questions

### The Big Question

I like a standup comedy show; what should I watch next?

### Supplementary Questions

  1.	What aspects of language are useful for communities of comedy style?
  2.	Do the topics that comedians speak about form communities?
  3.	Do the words that comedians use form communities?
  4.	Do any aspects of style or topics correlate with how standup shows are rated, and does this vary by rating system?

### Similar Projects

  - https://pudding.cool/2018/02/stand-up/
  - https://medium.com/nwamaka-imasogie/stand-up-comedy-and-nlp-c7d64002520c
  - https://medium.com/swlh/data-loves-comedy-analysis-of-a-standup-act-de297b0f8611
  - https://methodmatters.github.io/network-community-detection/

## Technologies

  - Python
    * [Jupyter Notebooks](https://jupyter.org/)
    * [pandas](https://pandas.pydata.org/)
    * [Plotly](https://plotly.com/)
    * [BeautifulSoup](https://beautiful-soup-4.readthedocs.io/en/latest/)
    * [Requests](https://docs.python-requests.org/en/latest/)
    * [NLTK](https://www.nltk.org/)
    * [Gensim](https://radimrehurek.com/gensim/)
    * [Spacy](https://spacy.io/)
    * [Textblob](https://textblob.readthedocs.io/en/dev/index.html)
    * [scikit-learn](https://scikit-learn.org/stable/)
  - [SQLite](https://www.sqlite.org/index.html)
  - R
    * [Shiny](https://shiny.rstudio.com/)
    * [Tidyverse](https://www.tidyverse.org/)
  - [Neo4J](https://neo4j.com/)
    * [Graph Data Science](https://neo4j.com/product/graph-data-science/)
  - [Gephi](https://gephi.org/)

## The Process (in which We Trust)

### Scrape & Store

  I used Python's BeautifulSoup and Request packages to scrape [Scraps from the Loft](https://scrapsfromtheloft.com/stand-up-comedy-scripts/)'s archive of standup comedy scripts. This archive includes standup performances from the 1960s through 2022. I initially scraped all 381 shows in the archive. I then cut my sample to 310, the number of shows whose titles returned results from the IMDB API title search function.

  The IMDB API supplied metadata and cover art for the shows. The metadata is the typical content one gets from an IMDB landing page for a special, including data like release date, content rating, user rating, production company, and runtime.

### Engineer Features

  The bulk of this project was feature engineering. I started with no data, pulled some metadata from IMDB, and otherwise derived all data points from the scraped transcripts. Features were collected into overall "feature groups". Here are the features groups and their corresponding features:

  - Metadata
    * year released
    * production company
    * content rating
    * runtime (minutes)
    * IMDB rating
    * IMDB rating votes
  - Word & Sentence Lengths
    * mean and standard deviation word lengths
    * quartiles of word lengths, including max
    * total words
    * total unique words
    * proportion unique words
    * unique words per sentence
    * words per minute
    * sentences per minute
    * mean and standard deviation sentence lengths
    * quartiles of sentence lengths, including max
  - Profanity
    * count of profane words
    * proportion of words that are profane
    * profane words per sentence
    * profanity per minute
  - Parts of Speech
    * verbs
    * pronouns
    * interjections
    * nouns
    * adverbs
    * auxiliaries
    * adjectives
    * particle
    * prepositions (aka "adpositions")
    * determiner
    * subordinating conjunctions
    * coordinating conjunctions
    * proper nouns
    * numbers
  - Point of View
    * first person
    * second person
    * third person
  - Sentiment
    * overall polarity
    * overall subjectivity
    * mean and standard deviation of sentence polarity
    * quartiles of polarity
    * mean and standard deviation of sentence subjectivity
    * quartiles of subjectivity
  - Lexicon
    * Used spaCy's NLP pipeline to tokenize and lemmatize, removed stopwords using NLTK, and counted values with Counter from the collections package. This creates a massive dataframe where each row is a show and each column is a count of word usage. Taking the cosine similarity of this dataframe (using SKLearn's cosine_similarity function) gives the lexical similarity of the performances.
  - Speed, Uniqueness, and Repetition
    * Used SKLearn's CountVectorizer class to create a matrix counting frequencies of all phrases (ngrams) up to 7 words long. This matrix was 301 x 7,159,922. I then used Numpy to calculate what proportion of each show was comprised of phrases repeated at least 3 times. This approach aims to catch both verbal idiosyncrasies as well as performative devices like callbacks.

### Find Similarities

  For each feature group above, I calculated the cosine similarity of each pair of shows' vectors of features, resulting in a 310x310 matrix of similarities. Once I had all 8 of these 301x310 similarity matrices, I created a new 310x310 matrix giving the mean cosine similarity score for each pair of shows. My top 5 recommendations for each show are that shows highest 5 cosine similarities, and I also include the lowest cosine similarity in case the user wants to try something different.

### Make a Shiny App

Once the mean cosine similarity matrix was built, I melted it into a very long dataframe with one column for the selected show, one column for the compared show, and a column for the mean cosine similarities. I also joined on the other similarity measures (in long form) as well as relevant metadata. Having all this, I put the data into a SQLite database, then pulled that database down into R where I could build the Shiny app. With a little bit of logic for the recommender and some reshaping of the UI, the recommender came to life.

### Detect Communities

Once I had a dataframe of similarities for all feature groups, I imported the data into Neo4J and ran the Louvain community detection algorithm on each feature group. The mean similarity relationship yielded 3 primary communities with a 0.64 modularity score. My next steps are to explore these mean-similarity as well as the ones for each feature group.

## Link to the App
[Find out what to watch next.](https://jrioross.shinyapps.io/standuprecommendershiny/)
