{
  "PUBLISHED_IN": {
    "count": 26357,
    "properties": {

    },
    "type": "relationship"
  },
  "Regulation": {
    "count": 22,
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
      "source_url": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "REGULATED_BY": {
        "count": 58,
        "direction": "in",
        "labels": [
          "VesselType"
        ],
        "properties": {

        }
      }
    }
  },
  "CITANCE": {
    "count": 27341,
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
    "count": 53462,
    "properties": {

    },
    "type": "relationship"
  },
  "ResearchArtifact": {
    "count": 9418,
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
        "count": 864,
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
    "count": 90533,
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
    "count": 81915,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_TOPIC": {
    "count": 270881,
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
    "count": 1585,
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
        "count": 139,
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
    "count": 273,
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
      "HAS_CONTRIBUTED_TO": {
        "count": 997,
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
      "PUBLISHED_IN": {
        "count": 346,
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
    "count": 9487,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_FUNDING_AGENCY": {
    "count": 635,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_IN_TEXT_MENTION": {
    "count": 10460,
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
    "count": 3633,
    "properties": {

    },
    "type": "relationship"
  },
  "Topic": {
    "count": 59736,
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
        "count": 11244,
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
  "VesselType": {
    "count": 41,
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
        "indexed": true,
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
      "REGULATED_BY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Regulation"
        ],
        "properties": {

        }
      },
      "MENTIONS": {
        "count": 299,
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
        "count": 394,
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
    "count": 49803,
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
        "count": 243,
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
  "REGULATED_BY": {
    "count": 58,
    "properties": {

    },
    "type": "relationship"
  },
  "Product": {
    "count": 27644,
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
        "indexed": false,
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
        "count": 563,
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
        "count": 1495,
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
        "count": 997,
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
          "VesselType"
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
          "VesselType"
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
    "count": 81915,
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
        "count": 3172,
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
    "count": 76474,
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
          "Product",
          "Venue"
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
        "count": 2605,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_BENEFICIARY": {
        "count": 9487,
        "direction": "in",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "HAS_FUNDING_AGENCY": {
        "count": 635,
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
    "count": 60,
    "properties": {

    },
    "type": "relationship"
  },
  "Datasource": {
    "count": 1129,
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
        "count": 1137,
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
    "count": 69853,
    "properties": {

    },
    "type": "relationship"
  },
  "MENTIONS": {
    "count": 8014,
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
  "HAS_TECHNOLOGY": {
    "count": 3903,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_RESEARCH_ARTIFACT": {
    "count": 9418,
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
    "count": 81914,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_PID": {
    "count": 50598,
    "properties": {

    },
    "type": "relationship"
  },
  "Technology": {
    "count": 792,
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
        "count": 148,
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