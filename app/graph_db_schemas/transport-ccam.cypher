{
  "SensorType": {
    "count": 17,
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
        "count": 1615,
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
        "count": 2131,
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
  "CommunicationType": {
    "count": 7,
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
        "count": 1615,
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
        "count": 2131,
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
    "count": 19754,
    "properties": {

    },
    "type": "relationship"
  },
  "VehicleType": {
    "count": 45,
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
        "count": 1615,
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
        "count": 2131,
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
  "CITANCE": {
    "count": 67424,
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
    "count": 32957,
    "properties": {

    },
    "type": "relationship"
  },
  "ResearchArtifact": {
    "count": 1731,
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
        "count": 168,
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
  "LevelOfAutomation": {
    "count": 52,
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
        "count": 1615,
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
        "count": 2131,
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
  "HAS_CONTRIBUTED_TO": {
    "count": 27766,
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
  "EntityConnectionType": {
    "count": 11,
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
        "count": 1615,
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
        "count": 2131,
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
  "HAS_MANIFESTATION": {
    "count": 25605,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_TOPIC": {
    "count": 43404,
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
    "count": 623,
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
        "count": 118,
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
    "count": 29,
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
        "count": 1291,
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
        "count": 820,
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
    "count": 3805,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_FUNDING_AGENCY": {
    "count": 47,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_IN_TEXT_MENTION": {
    "count": 22258,
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
    "count": 1045,
    "properties": {

    },
    "type": "relationship"
  },
  "Topic": {
    "count": 6364,
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
        "count": 4149,
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
  "Pid": {
    "count": 26413,
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
        "count": 451,
        "direction": "in",
        "labels": [
          "Agent",
          "Grant",
          "Venue",
          "Topic",
          "Datasource",
          "Product"
        ],
        "properties": {

        }
      }
    }
  },
  "Product": {
    "count": 11824,
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
        "count": 4453,
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
        "count": 2578,
        "direction": "out",
        "labels": [
          "Product",
          "Product"
        ],
        "properties": {

        }
      },
      "IS_SUPPLEMENTED_BY": {
        "count": 1,
        "direction": "out",
        "labels": [
          "Product",
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_CONTRIBUTED_TO": {
        "count": 1291,
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
          "VehicleType",
          "ScenarioType",
          "SensorType",
          "LevelOfAutomation",
          "CommunicationType",
          "EntityConnectionType",
          "VRUType"
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
          "ScenarioType",
          "VehicleType",
          "SensorType",
          "LevelOfAutomation",
          "EntityConnectionType",
          "CommunicationType",
          "VRUType"
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
    "count": 25605,
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
        "count": 2502,
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
    "count": 21934,
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
        "count": 2539,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_BENEFICIARY": {
        "count": 3805,
        "direction": "in",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "HAS_FUNDING_AGENCY": {
        "count": 47,
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
    "count": 13,
    "properties": {

    },
    "type": "relationship"
  },
  "VRUType": {
    "count": 7,
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
        "count": 1615,
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
        "count": 2131,
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
  "Datasource": {
    "count": 455,
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
        "count": 1066,
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
    "count": 26020,
    "properties": {

    },
    "type": "relationship"
  },
  "MENTIONS": {
    "count": 16534,
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
    "count": 6977,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_RESEARCH_ARTIFACT": {
    "count": 1731,
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
  "ScenarioType": {
    "count": 11,
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
        "count": 1615,
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
        "count": 2131,
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
  "HOSTED_BY": {
    "count": 25605,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_PID": {
    "count": 26686,
    "properties": {

    },
    "type": "relationship"
  },
  "Technology": {
    "count": 1001,
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
        "count": 688,
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