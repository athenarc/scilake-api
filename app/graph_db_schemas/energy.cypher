{
  "IS_NEW_VERSION_OF": {
    "count": 961,
    "properties": {

    },
    "type": "relationship"
  },
  "IrenaType": {
    "count": 266,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "concept": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "description": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "wikidata_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "wikidata_aliases": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "IS_TYPE_OF": {
        "count": 232,
        "direction": "in",
        "labels": [
          "EnergyType",
          "EnergyStorage"
        ],
        "properties": {

        }
      },
      "SUBCLASS_OF": {
        "count": 262,
        "direction": "out",
        "labels": [
          "IrenaType",
          "IrenaType"
        ],
        "properties": {

        }
      }
    }
  },
  "PUBLISHED_IN": {
    "count": 10108073,
    "properties": {

    },
    "type": "relationship"
  },
  "CITANCE": {
    "count": 23066390,
    "properties": {
      "local_identifier": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "semantics_scores": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "semantics": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "polarity": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "polarity_scores": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "intent": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "intent_scores": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      }
    },
    "type": "relationship"
  },
  "CITES": {
    "count": 66722376,
    "properties": {

    },
    "type": "relationship"
  },
  "ResearchArtifact": {
    "count": 649760,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "urls": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "label": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "licenses": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_RESEARCH_ARTIFACT": {
        "count": 55,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
          "mentions_count": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "reused_percentage": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "owned_percentage": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "reused_score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "research_artifact_score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "owned_score": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "owned": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "reused": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "HAS_CONTRIBUTED_TO": {
    "count": 43653119,
    "properties": {
      "rank": {
        "indexed": false,
        "type": "INTEGER",
        "existence": false,
        "array": false
      },
      "role": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HAS_MANIFESTATION": {
    "count": 21088942,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_TOPIC": {
    "count": 47825366,
    "properties": {
      "provenance": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Grant": {
    "count": 101936,
    "labels": [],
    "properties": {
      "abstract": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "keywords": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "acronym": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "website": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "duration_start": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "funded_amount": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "currency": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "title": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "grant_number": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "funding_stream": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "duration_end": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "entity_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_BENEFICIARY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Agent"
        ],
        "properties": {

        }
      },
      "HAS_FUNDING_AGENCY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Agent"
        ],
        "properties": {

        }
      },
      "FUNDED_BY": {
        "count": 74,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_PID": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pid"
        ],
        "properties": {

        }
      }
    }
  },
  "Venue": {
    "count": 47564,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "entity_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "PUBLISHED_IN": {
        "count": 485,
        "direction": "in",
        "labels": [
          "Manifestation"
        ],
        "properties": {

        }
      },
      "HAS_PID": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pid"
        ],
        "properties": {

        }
      }
    }
  },
  "HAS_BENEFICIARY": {
    "count": 321072,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_FUNDING_AGENCY": {
    "count": 96749,
    "properties": {

    },
    "type": "relationship"
  },
  "EnergyStorage": {
    "count": 38,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "MENTIONS": {
        "count": 719,
        "direction": "in",
        "labels": [
          "Product",
          "LegalDocument"
        ],
        "properties": {
          "weight": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_TYPE_OF": {
        "count": 0,
        "direction": "out",
        "labels": [
          "IrenaType"
        ],
        "properties": {

        }
      },
      "HAS_IN_TEXT_MENTION": {
        "count": 955,
        "direction": "in",
        "labels": [
          "Product",
          "LegalDocument"
        ],
        "properties": {
          "section_title": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "model": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "text": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "section_label": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "HAS_IN_TEXT_MENTION": {
    "count": 7921368,
    "properties": {
      "section_title": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "model": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "text": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "start": {
        "indexed": false,
        "type": "INTEGER",
        "existence": false,
        "array": false
      },
      "role": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "end": {
        "indexed": false,
        "type": "INTEGER",
        "existence": false,
        "array": false
      },
      "section_label": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "FUNDED_BY": {
    "count": 622212,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_PART_OF": {
    "count": 68468,
    "properties": {

    },
    "type": "relationship"
  },
  "Topic": {
    "count": 2463859,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "label": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "entity_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_TOPIC": {
        "count": 5495,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
          "provenance": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "SUBCLASS_OF": {
    "count": 265,
    "properties": {

    },
    "type": "relationship"
  },
  "Pid": {
    "count": 10119146,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "scheme": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "value": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_PID": {
        "count": 3,
        "direction": "in",
        "labels": [
          "Agent",
          "Grant",
          "Venue",
          "Datasource",
          "Product"
        ],
        "properties": {

        }
      }
    }
  },
  "LegalDocument": {
    "count": 5236,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "rsNr": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "it_abbreviation": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "rm_url": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "en_dateApplicability": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "de_url": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "rm_abbreviation": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "rm_lawTitle": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "de_lawTitle": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "fr_abbreviation": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "it_url": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "de_dateApplicability": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "fr_dateApplicability": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "en_abbreviation": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "it_dateApplicability": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "rm_dateApplicability": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "fr_lawTitle": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "de_abbreviation": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "en_lawTitle": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "it_lawTitle": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "fr_url": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "en_url": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "MENTIONS": {
        "count": 0,
        "direction": "out",
        "labels": [
          "EnergyType",
          "EnergyStorage"
        ],
        "properties": {
          "weight": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_IN_TEXT_MENTION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "EnergyType",
          "EnergyStorage"
        ],
        "properties": {
          "section_title": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "model": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "text": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "section_label": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "EnergyType": {
    "count": 317,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "MENTIONS": {
        "count": 719,
        "direction": "in",
        "labels": [
          "Product",
          "LegalDocument"
        ],
        "properties": {
          "weight": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_TYPE_OF": {
        "count": 0,
        "direction": "out",
        "labels": [
          "IrenaType"
        ],
        "properties": {

        }
      },
      "HAS_IN_TEXT_MENTION": {
        "count": 955,
        "direction": "in",
        "labels": [
          "Product",
          "LegalDocument"
        ],
        "properties": {
          "section_title": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "model": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "text": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "section_label": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Product": {
    "count": 7677002,
    "labels": [],
    "properties": {
      "abstract": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "popularity_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "citation_count": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "citation_count_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "influence": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "product_type": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "repro_focused_rci": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "impulse_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "repro_positive_mentions_count": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "impulse": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "has_energy_type": {
        "unique": false,
        "indexed": true,
        "type": "BOOLEAN",
        "existence": false
      },
      "title": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "has_energy_storage": {
        "unique": false,
        "indexed": true,
        "type": "BOOLEAN",
        "existence": false
      },
      "repro_rci": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "entity_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "influence_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "popularity": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "CITANCE": {
        "count": 1643,
        "direction": "out",
        "labels": [
          "Product",
          "Product"
        ],
        "properties": {
          "local_identifier": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "semantics_scores": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "semantics": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "polarity": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "polarity_scores": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "intent": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "intent_scores": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          }
        }
      },
      "CITES": {
        "count": 6893,
        "direction": "out",
        "labels": [
          "Product",
          "Product"
        ],
        "properties": {

        }
      },
      "IS_SUPPLEMENTED_BY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product",
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_CONTRIBUTED_TO": {
        "count": 1057,
        "direction": "in",
        "labels": [
          "Agent"
        ],
        "properties": {
          "rank": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_MANIFESTATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Manifestation"
        ],
        "properties": {

        }
      },
      "IS_RELEVANT_TO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Agent"
        ],
        "properties": {

        }
      },
      "MENTIONS": {
        "count": 0,
        "direction": "out",
        "labels": [
          "EnergyType",
          "GeographicEntity",
          "EnergyStorage"
        ],
        "properties": {
          "weight": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_TOPIC": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Topic"
        ],
        "properties": {
          "provenance": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_IN_TEXT_MENTION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "EnergyType",
          "GeographicEntity",
          "EnergyStorage"
        ],
        "properties": {
          "section_title": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "model": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "text": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "section_label": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "FUNDED_BY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "IS_PART_OF": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product",
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_RESEARCH_ARTIFACT": {
        "count": 0,
        "direction": "out",
        "labels": [
          "ResearchArtifact"
        ],
        "properties": {
          "mentions_count": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "reused_percentage": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "owned_percentage": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "reused_score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "research_artifact_score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "owned_score": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "owned": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "reused": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_TECHNOLOGY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Technology"
        ],
        "properties": {

        }
      },
      "HAS_PID": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pid"
        ],
        "properties": {

        }
      }
    }
  },
  "Manifestation": {
    "count": 21088942,
    "labels": [],
    "properties": {
      "type_defined_in": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "licence": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "type_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "biblio": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "access_rights_status": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "access_rights_description": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "publication_date": {
        "unique": false,
        "indexed": true,
        "type": "DATE",
        "existence": false
      },
      "peer_review_status": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "type_label": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_MANIFESTATION": {
        "count": 2554,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HOSTED_BY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Datasource"
        ],
        "properties": {

        }
      },
      "PUBLISHED_IN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Venue"
        ],
        "properties": {

        }
      }
    }
  },
  "Agent": {
    "count": 36234277,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "website": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "family_name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "types": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "entity_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "short_name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "given_name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "other_names": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "country": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_CONTRIBUTED_TO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product"
        ],
        "properties": {
          "rank": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_RELEVANT_TO": {
        "count": 1898,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_BENEFICIARY": {
        "count": 3728,
        "direction": "in",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "HAS_FUNDING_AGENCY": {
        "count": 1036,
        "direction": "in",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "HAS_PID": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pid"
        ],
        "properties": {

        }
      }
    }
  },
  "IS_SUPPLEMENTED_BY": {
    "count": 154933,
    "properties": {

    },
    "type": "relationship"
  },
  "Datasource": {
    "count": 56713,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "research_product_types": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "data_source_classification": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "entity_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HOSTED_BY": {
        "count": 1012,
        "direction": "in",
        "labels": [
          "Manifestation"
        ],
        "properties": {

        }
      },
      "HAS_PID": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pid"
        ],
        "properties": {

        }
      }
    }
  },
  "IS_RELEVANT_TO": {
    "count": 16860726,
    "properties": {

    },
    "type": "relationship"
  },
  "MENTIONS": {
    "count": 6367339,
    "properties": {
      "weight": {
        "indexed": false,
        "type": "INTEGER",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "IS_TYPE_OF": {
    "count": 263,
    "properties": {

    },
    "type": "relationship"
  },
  "GeographicEntity": {
    "count": 33737,
    "labels": [],
    "properties": {
      "display_name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "lon": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      },
      "wikidata": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "osm_id": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "boundingbox": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "osm_type": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "lat": {
        "unique": false,
        "indexed": false,
        "type": "FLOAT",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "MENTIONS": {
        "count": 719,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
          "weight": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_IN_TEXT_MENTION": {
        "count": 955,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
          "section_title": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "model": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "text": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "role": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "INTEGER",
            "existence": false,
            "array": false
          },
          "section_label": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "HAS_TECHNOLOGY": {
    "count": 3796350,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_RESEARCH_ARTIFACT": {
    "count": 649760,
    "properties": {
      "mentions_count": {
        "indexed": false,
        "type": "INTEGER",
        "existence": false,
        "array": false
      },
      "reused_percentage": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "owned_percentage": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "reused_score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "research_artifact_score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "owned_score": {
        "indexed": false,
        "type": "INTEGER",
        "existence": false,
        "array": false
      },
      "owned": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "reused": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HOSTED_BY": {
    "count": 21088561,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_DOCUMENTED_BY": {
    "count": 2534,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_PID": {
    "count": 10137663,
    "properties": {

    },
    "type": "relationship"
  },
  "Technology": {
    "count": 10782,
    "labels": [],
    "properties": {
      "local_identifier": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_TECHNOLOGY": {
        "count": 478,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      }
    }
  }
}