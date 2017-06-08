# -*- coding: utf-8 -*-
import warnings
from datetime import datetime


class DocumentBaseRecord(object):

    def __init__(self, legal_state, published_from, text_at_web=None):
        """
        The base document class.

        Args:
            legal_state (str): Key string of the law status.
            published_from (datetime.date): Date since this document was published.
            text_at_web (dict): The multilingual URI to the documents content.
        """
        if text_at_web and not isinstance(text_at_web, dict):
            warnings.warn('Type of "text_at_web" should be "dict"')

        self.text_at_web = text_at_web
        self.legal_state = legal_state
        self.published_from = published_from

    @property
    def published(self):
        """
        Returns true if its not a future document.

        Returns:
            bool: True if document is published.
        """
        return not self.published_from > datetime.now().date()


class ArticleRecord(DocumentBaseRecord):

    def __init__(self, legal_state, published_from, number, text_at_web=None, text=None):
        """
        More specific document class representing articles.

        Args:
            legal_state (str): Key string of the law status.
            published_from (datetime.date): Date since this document was published.
            number (str): The identifier of the article as a law.
            text_at_web (dict): The URI to the documents content (multilingual).
            text (dict): Text in the article (multilingual).
        """
        super(ArticleRecord, self).__init__(legal_state, published_from, text_at_web)

        if text and not isinstance(text, dict):
            warnings.warn('Type of "text" should be "dict"')

        self.number = number
        self.text = text


class DocumentRecord(DocumentBaseRecord):

    def __init__(self, legal_state, published_from, title, responsible_office, text_at_web=None,
                 abbreviation=None, official_number=None, official_title=None, canton=None,
                 municipality=None, article_numbers=None, file=None, articles=None, references=None):
        """
        More specific document class representing real documents.

        Args:
            legal_state (str):  Key string of the law status.
            published_from (datetime.date): Date since this document was published.
            title (dict): The multilingual title of the document. It might be shortened one.
            responsible_office (pyramid_oereb.lib.records.office.OfficeRecord): Office which is
                responsible for this document.
            text_at_web (dict): The multilingual URI to the documents content.
            official_title (dict): The official title of the document (multilingual).
            abbreviation (dict): Short term for this document (multilingual).
            official_number (str): The official number for identification of this document.
            canton (str): The cantonal short term (length of two, like 'NE' or 'BL')
            municipality (str): The code for the municipality.
            article_numbers (list of str): Pointers to specific articles.
            file (bytes): The binary content of the document.
            articles (list of ArticleRecord): The linked articles.
            references (list of DocumentRecord): The references to other documents.
        """
        super(DocumentRecord, self).__init__(legal_state, published_from, text_at_web)

        if not isinstance(title, dict):
            warnings.warn('Type of "title" should be "dict"')
        if text_at_web and not isinstance(text_at_web, dict):
            warnings.warn('Type of "text_at_web" should be "dict"')
        if official_title and not isinstance(official_title, dict):
            warnings.warn('Type of "official_title" should be "dict"')
        if abbreviation and not isinstance(abbreviation, dict):
            warnings.warn('Type of "abbreviation" should be "dict"')

        self.title = title
        self.responsible_office = responsible_office
        self.official_title = official_title
        self.abbreviation = abbreviation
        self.official_number = official_number
        self.canton = canton
        self.municipality = municipality
        if isinstance(article_numbers, list):
            self.article_numbers = article_numbers
        else:
            self.article_numbers = []
        self.file = file
        if articles is None:
            self.articles = []
        else:
            self.articles = articles
        if references is None:
            self.references = []
        else:
            self.references = references


class LegalProvisionRecord(DocumentRecord):
    pass
