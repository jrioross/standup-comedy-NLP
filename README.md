# standup-comedy-NLP

## Table of Contents

- [Motivation](#Motivation)
- [Technologies](#Technologies)
- [Data Questions](#Data-Questions)
- [The Process (in which We Trust)](#The-Process-in-which-We-Trust)
- [Link to the Dashboard](#Link-to-the-Dashboard)

## Motivation

   I’ve always been interested in language as a craft. I studied theology, philosophy, and literature, and I write both essays and poetry. Attending to the intricacies of language is essential for systematic thinking, clear communication, and persuasive rhetoric. But this attention isn’t just reserved for written communication. Standup comedy turns the craft of language into a performance, a spoken art. And while I’ve not (yet) done standup comedy myself, the advent of streaming has made standup comedy more accessible than ever.

   How standup comedians craft their language and delivery varies dramatically, as do the actual topics that comedians address. Mitch Hedberg is well known for his strange and surprising one-liners, while Mike Birbiglia is a raconteur whose setups can be paragraphs long (albeit breadcrumbed with additional comedic content). Very often I want to recommend a comedian or show to someone because of their sense of humor and/or some characteristics of the comedian. By contrast, I don’t think most algorithmic recommendations like those from Google or Netflix work that way; rather, they work on a “people who liked A also liked B” model. These models are certainly useful, but they are not necessarily weighted by similarity in comedic style; rather, they are often weighted by era, sex, or race.

   I therefore want to develop a model that will recommend standup comedians based upon specific style criteria or based upon having a similar style to a selected comedian. These style components will be primarily dependent upon the comedians’ topics spoken about and their use of language.

## Data Sources

  - [Scraps from the Loft](https://scrapsfromtheloft.com/stand-up-comedy-scripts/)
  - [IMDB-API](https://imdb-api.com)

## Data Questions

### The Big Question

If I like a certain comedian or style of comedy, what should I watch next?

### Supplementary Questions

  1.	What aspects of language are useful for clustering comedians by style?
  2.	Do the topics that comedians speak about form communities?
  3.	Do the words that comedians use form communities?
  4.	Do any aspects of style or topics correlate with how standup shows are rated, and does this vary by rating system?

### Similar Projects

  - https://pudding.cool/2018/02/stand-up/
  - https://medium.com/nwamaka-imasogie/stand-up-comedy-and-nlp-c7d64002520c
  - https://medium.com/swlh/data-loves-comedy-analysis-of-a-standup-act-de297b0f8611

## Technologies

  - Python
    * [Jupyter Notebooks](https://jupyter.org/)
    * [pandas](https://pandas.pydata.org/)
    * [requests](https://docs.python-requests.org/en/latest/)
    * [NLTK](https://www.nltk.org/)
    * [Gensim](https://radimrehurek.com/gensim/)
    * [Spacy](https://spacy.io/)
    * [Dash](https://dash.plotly.com/)

## The Process (in which We Trust)

  <details>
    <summary>Scrape & Store</summary>

  I used Python's BeautifulSoup and Request packages to scrape [Scraps from the Loft](https://scrapsfromtheloft.com/stand-up-comedy-scripts/)'s archive of standup comedy scripts. This archive includes standup performances from the 1960s through 2022.

  </details>

  <details>
    <summary>Feature Engineering</summary>

  Measures:

      - Laughs per show
      - Words between jokes/laughs
      - Time between jokes/laughs
      - Words per show
      - Words per minute
      - Average word length/syllables
      - Average words/syllables per sentence
      - Number of distinct words
      - Number of repeated words
      - Parts-of-speech frequency
      - Similarity of sentence structure?
      - Try to investigate phrases (n-grams) and not just words. e.g. "You know" or "or whatever" or "I guess"
      - Typical amount of repetition
      - Frequency of 1st, 2nd, 3rd person language
      - Topics
      - Sentiment (maybe by topic)
      - Diction (including cussing)

  </details>

  <details>
    <summary>Model</summary>

  Use unsupervised learning...

  </details>

## The Dash App

The current version of the app...



## Link to the App
Put app to work.
