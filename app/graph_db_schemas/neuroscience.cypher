{
  "PreparationType": {
    "count": 12,
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
      "MENTIONS": {
        "count": 4146,
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
        "count": 4839,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
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
          }
        }
      }
    }
  },
  "IS_NEW_VERSION_OF": {
    "count": 545,
    "properties": {

    },
    "type": "relationship"
  },
  "Technique": {
    "count": 310,
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
      "MENTIONS": {
        "count": 4146,
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
        "count": 4839,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
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
          }
        }
      }
    }
  },
  "PUBLISHED_IN": {
    "count": 7872021,
    "properties": {

    },
    "type": "relationship"
  },
  "CITANCE": {
    "count": 40163949,
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
    "count": 57056806,
    "properties": {

    },
    "type": "relationship"
  },
  "UBERONParcellation": {
    "count": 2888,
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
      "MENTIONS": {
        "count": 4146,
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
        "count": 4839,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
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
          }
        }
      }
    }
  },
  "ResearchArtifact": {
    "count": 468471,
    "labels": [],
    "properties": {
      "versions": {
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
        "count": 182,
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
            "type": "INTEGER",
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
            "type": "FLOAT",
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
    "count": 17596918,
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
    "count": 12359407,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_TOPIC": {
    "count": 46744215,
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
    "count": 124470,
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
        "count": 146,
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
    "count": 12916,
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
        "count": 697,
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
    "count": 190696,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_FUNDING_AGENCY": {
    "count": 122082,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_IN_TEXT_MENTION": {
    "count": 16060362,
    "properties": {
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
      }
    },
    "type": "relationship"
  },
  "FUNDED_BY": {
    "count": 722564,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_PART_OF": {
    "count": 1020,
    "properties": {

    },
    "type": "relationship"
  },
  "Topic": {
    "count": 881080,
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
        "count": 13614,
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
  "Species": {
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
      "MENTIONS": {
        "count": 4146,
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
        "count": 4839,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
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
          }
        }
      }
    }
  },
  "Pid": {
    "count": 7677908,
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
        "count": 8,
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
  "Product": {
    "count": 3576758,
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
      "title": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
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
        "count": 6167,
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
        "count": 15412,
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
        "count": 1589,
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
          "Technique",
          "UBERONParcellation",
          "BiologicalSex",
          "Species",
          "PreparationType"
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
          "Technique",
          "UBERONParcellation",
          "Species",
          "BiologicalSex",
          "PreparationType"
        ],
        "properties": {
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
            "type": "INTEGER",
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
            "type": "FLOAT",
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
    "count": 12359407,
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
      "_data": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "publication_date": {
        "unique": false,
        "indexed": false,
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
        "count": 3539,
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
    "count": 14429467,
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
        "count": 2919,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_BENEFICIARY": {
        "count": 1416,
        "direction": "in",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "HAS_FUNDING_AGENCY": {
        "count": 944,
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
    "count": 75271,
    "properties": {

    },
    "type": "relationship"
  },
  "Datasource": {
    "count": 17388,
    "labels": [],
    "properties": {
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
        "count": 1058,
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
    "count": 10353517,
    "properties": {

    },
    "type": "relationship"
  },
  "MENTIONS": {
    "count": 13793444,
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
  "BiologicalSex": {
    "count": 8,
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
      "MENTIONS": {
        "count": 4146,
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
        "count": 4839,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {
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
          }
        }
      }
    }
  },
  "HAS_TECHNOLOGY": {
    "count": 1058662,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_RESEARCH_ARTIFACT": {
    "count": 468471,
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
        "type": "INTEGER",
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
        "type": "FLOAT",
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
    "count": 12359401,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_DOCUMENTED_BY": {
    "count": 3221,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_PID": {
    "count": 7685387,
    "properties": {

    },
    "type": "relationship"
  },
  "Technology": {
    "count": 6917,
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
        "count": 280,
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