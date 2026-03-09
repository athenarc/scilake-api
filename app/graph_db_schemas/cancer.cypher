{
  "User": {
    "count": 3,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "username": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "rolename": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "phone_number": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "acronym": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "email": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "expiration_date": {
        "unique": false,
        "indexed": false,
        "type": "LOCAL_DATE_TIME",
        "existence": false
      },
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "image": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "affiliation": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "secondary_email": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "password": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "IS_RESPONSIBLE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Project"
        ],
        "properties": {

        }
      },
      "PARTICIPATES_IN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Project"
        ],
        "properties": {

        }
      }
    }
  },
  "Biological_process": {
    "count": 28931,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 1872,
        "direction": "out",
        "labels": [
          "Biological_process",
          "Biological_process"
        ],
        "properties": {

        }
      },
      "ASSOCIATED_WITH": {
        "count": 68182,
        "direction": "in",
        "labels": [
          "Protein",
          "Modified_protein",
          "Complex"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "CURATED_INTERACTS_WITH": {
    "count": 299188,
    "properties": {
      "interaction_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "evidence": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "method": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      }
    },
    "type": "relationship"
  },
  "Chromosome": {
    "count": 25,
    "labels": [],
    "properties": {
      "id": {
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
      "taxid": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "VARIANT_FOUND_IN_CHROMOSOME": {
        "count": 1101,
        "direction": "in",
        "labels": [
          "Known_variant"
        ],
        "properties": {

        }
      },
      "LOCATED_IN": {
        "count": 961,
        "direction": "in",
        "labels": [
          "Transcript"
        ],
        "properties": {
          "start": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "strand": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Protein_structure": {
    "count": 49317,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "link": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_STRUCTURE": {
        "count": 594,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Pathway": {
    "count": 51219,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "linkout": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "organism": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "ANNOTATED_IN_PATHWAY": {
        "count": 283,
        "direction": "in",
        "labels": [
          "Protein",
          "Metabolite"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "cellular_component": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "organism": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Project": {
    "count": 9,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "acronym": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "responsible": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "tissue": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "participant": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "disease": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "internal_id": {
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
      "IS_RESPONSIBLE": {
        "count": 13,
        "direction": "in",
        "labels": [
          "User"
        ],
        "properties": {

        }
      },
      "STUDIES_DISEASE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Disease"
        ],
        "properties": {

        }
      },
      "PARTICIPATES_IN": {
        "count": 13,
        "direction": "in",
        "labels": [
          "User"
        ],
        "properties": {

        }
      },
      "HAS_ENROLLED": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Subject"
        ],
        "properties": {

        }
      },
      "STUDIES_TISSUE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Tissue"
        ],
        "properties": {

        }
      }
    }
  },
  "STUDIES_TRAIT": {
    "count": 9250,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HAS_MODIFICATION": {
    "count": 410326,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Protein": {
    "count": 228726,
    "labels": [],
    "properties": {
      "id": {
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
      "accession": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "taxid": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "DETECTED_IN_PATHOLOGY_SAMPLE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Disease"
        ],
        "properties": {
          "expression_high": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "negative_prognosis_logrank_pvalue": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "linkout": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "positive_prognosis_logrank_pvalue": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "expression_low": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "expression_medium": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "not_detected": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "ACTS_ON": {
        "count": 5066,
        "direction": "out",
        "labels": [
          "Protein",
          "Protein",
          "Drug"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "directionality": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          }
        }
      },
      "CURATED_INTERACTS_WITH": {
        "count": 1384,
        "direction": "out",
        "labels": [
          "Protein",
          "Protein"
        ],
        "properties": {
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "evidence": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "method": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          }
        }
      },
      "IS_SUBSTRATE_OF": {
        "count": 39,
        "direction": "in",
        "labels": [
          "Modified_protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "regulation": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "COMPILED_TARGETS": {
        "count": 9497,
        "direction": "in",
        "labels": [
          "Drug"
        ],
        "properties": {
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "scores": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "evidences": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          }
        }
      },
      "ASSOCIATED_WITH": {
        "count": 4232,
        "direction": "out",
        "labels": [
          "Cellular_component",
          "Tissue",
          "Disease",
          "Biological_process",
          "Molecular_function",
          "Metabolite"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_SEQUENCE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Amino_acid_sequence"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "TRANSLATED_INTO": {
        "count": 3464,
        "direction": "in",
        "labels": [
          "Gene",
          "Transcript"
        ],
        "properties": {

        }
      },
      "BELONGS_TO_PROTEIN": {
        "count": 3457,
        "direction": "in",
        "labels": [
          "Peptide"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_QUANTIFIED_PROTEIN": {
        "count": 797651,
        "direction": "in",
        "labels": [
          "Analytical_sample"
        ],
        "properties": {
          "qvalue": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "is_razor": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "intensity": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "value": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "proteinGroup": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "VARIANT_FOUND_IN_PROTEIN": {
        "count": 2713,
        "direction": "in",
        "labels": [
          "Known_variant"
        ],
        "properties": {

        }
      },
      "ANNOTATED_IN_PATHWAY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pathway"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "cellular_component": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "organism": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "COMPILED_INTERACTS_WITH": {
        "count": 8677,
        "direction": "out",
        "labels": [
          "Protein",
          "Protein"
        ],
        "properties": {
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "scores": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "evidence": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_STRUCTURE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein_structure"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Publication",
          "Product"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_SUBUNIT_OF": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Complex"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "cell_lines": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "evidences": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "publication": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_BIOMARKER_OF_DISEASE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Disease"
        ],
        "properties": {
          "age_units": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "normal_range": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "is_used_in_clinic": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          },
          "sex": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "assay": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "is_routine": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          },
          "notes": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "reference": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "age_range": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "units": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "FOUND_IN_PROTEIN": {
        "count": 9794,
        "direction": "in",
        "labels": [
          "Functional_region"
        ],
        "properties": {
          "alignment": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_MODIFIED_SITE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Modified_protein"
        ],
        "properties": {

        }
      },
      "IS_QCMARKER_IN_TISSUE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Tissue"
        ],
        "properties": {
          "class": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Molecular_function": {
    "count": 11522,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 1355,
        "direction": "out",
        "labels": [
          "Molecular_function",
          "Molecular_function"
        ],
        "properties": {

        }
      },
      "ASSOCIATED_WITH": {
        "count": 68182,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "VARIANT_FOUND_IN_CHROMOSOME": {
    "count": 10630108,
    "properties": {

    },
    "type": "relationship"
  },
  "COMPILED_TARGETS": {
    "count": 137036,
    "properties": {
      "interaction_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "scores": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "evidences": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      }
    },
    "type": "relationship"
  },
  "HAS_ENROLLED": {
    "count": 169,
    "properties": {

    },
    "type": "relationship"
  },
  "VARIANT_FOUND_IN_PROTEIN": {
    "count": 26807293,
    "properties": {

    },
    "type": "relationship"
  },
  "Publication": {
    "count": 1791712,
    "labels": [],
    "properties": {
      "journal": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "PMC_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "page": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "issue": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "linkout": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "volume": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "year": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "DOI": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "SAME_AS": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 5046674,
        "direction": "in",
        "labels": [
          "Disease",
          "Tissue",
          "Cellular_component",
          "Protein",
          "Drug",
          "Functional_region"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "PUBLISHED_IN": {
        "count": 1144,
        "direction": "in",
        "labels": [
          "GWAS_study"
        ],
        "properties": {
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Functional_region": {
    "count": 16169,
    "labels": [],
    "properties": {
      "id": {
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
      "description": {
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
      "MENTIONED_IN_PUBLICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product",
          "Publication"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "FOUND_IN_PROTEIN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {
          "alignment": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "start": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "IS_QCMARKER_IN_TISSUE": {
    "count": 249,
    "properties": {
      "class": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "VARIANT_IS_CLINICALLY_RELEVANT": {
    "count": 169,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_SUBSTRATE_OF": {
    "count": 15177,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "regulation": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "evidence_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Food": {
    "count": 992,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "scientific_name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "group": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "subgroup": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {

    }
  },
  "PUBLISHED_IN": {
    "count": 7878,
    "properties": {
      "mapped": {
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "ResearchArtifact": {
    "count": 1772343,
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
        "count": 260,
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
  "IS_RESPONSIBLE": {
    "count": 13,
    "properties": {

    },
    "type": "relationship"
  },
  "Grant": {
    "count": 253963,
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
        "count": 220,
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
  "FUNDED_BY": {
    "count": 1430893,
    "properties": {

    },
    "type": "relationship"
  },
  "Topic": {
    "count": 1964134,
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
        "count": 10454,
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
  "IS_BIOMARKER_OF_DISEASE": {
    "count": 515,
    "properties": {
      "age_units": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "normal_range": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "is_used_in_clinic": {
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false,
        "array": false
      },
      "sex": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "assay": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "is_routine": {
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false,
        "array": false
      },
      "notes": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "reference": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "age_range": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "units": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "IS_SUBUNIT_OF": {
    "count": 10968,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "cell_lines": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "evidences": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "publication": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "STUDIES_TISSUE": {
    "count": 9,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_MODIFIED_SITE": {
    "count": 394748,
    "properties": {

    },
    "type": "relationship"
  },
  "Gene": {
    "count": 42571,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "subgraph": {
        "unique": false,
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false
      },
      "family": {
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
      "community": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "taxid": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "CURATED_TARGETS": {
        "count": 1087,
        "direction": "in",
        "labels": [
          "Drug"
        ],
        "properties": {
          "response": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "disease": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "TRANSCRIBED_INTO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Transcript"
        ],
        "properties": {

        }
      },
      "VARIANT_FOUND_IN_GENE": {
        "count": 1103,
        "direction": "in",
        "labels": [
          "Known_variant"
        ],
        "properties": {

        }
      },
      "TRANSLATED_INTO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {

        }
      },
      "RELATED_TO": {
        "count": 132,
        "direction": "out",
        "labels": [
          "Gene",
          "Gene"
        ],
        "properties": {
          "provenance": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "pearson": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "spearman": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "slope": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "MI": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "p_value": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Subject": {
    "count": 169,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "external_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "BELONGS_TO_SUBJECT": {
        "count": 170,
        "direction": "in",
        "labels": [
          "Biological_sample"
        ],
        "properties": {

        }
      },
      "HAS_ENROLLED": {
        "count": 169,
        "direction": "in",
        "labels": [
          "Project"
        ],
        "properties": {

        }
      }
    }
  },
  "Clinically_relevant_variant": {
    "count": 190334,
    "labels": [],
    "properties": {
      "position": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "effect": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "alternative_names": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "alternative": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "chromosome": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "oncogeneicity": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "reference": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "TARGETS_CLINICALLY_RELEVANT_VARIANT": {
        "count": 509,
        "direction": "in",
        "labels": [
          "Drug"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "disease": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "ASSOCIATED_WITH": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Disease"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "STUDIES_DISEASE": {
    "count": 13,
    "properties": {

    },
    "type": "relationship"
  },
  "BELONGS_TO_SUBJECT": {
    "count": 170,
    "properties": {

    },
    "type": "relationship"
  },
  "Biological_sample": {
    "count": 170,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "external_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "BELONGS_TO_SUBJECT": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Subject"
        ],
        "properties": {

        }
      },
      "SPLITTED_INTO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Analytical_sample"
        ],
        "properties": {

        }
      }
    }
  },
  "Modification": {
    "count": 1978,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 3565,
        "direction": "out",
        "labels": [
          "Modification",
          "Modification"
        ],
        "properties": {

        }
      },
      "HAS_MODIFICATION": {
        "count": 1115,
        "direction": "in",
        "labels": [
          "Modified_protein"
        ],
        "properties": {
          "source": {
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
    "count": 46723,
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
        "count": 1009,
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
  "TRANSCRIBED_INTO": {
    "count": 258487,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_PARENT": {
    "count": 140660,
    "properties": {

    },
    "type": "relationship"
  },
  "Amino_acid_sequence": {
    "count": 20614,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "sequence": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "header": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "size": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_SEQUENCE": {
        "count": 100,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "HAS_QUANTIFIED_MODIFIED_PROTEIN": {
    "count": 224478,
    "properties": {
      "deltaScore": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "scoreLocalization": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "is_razor": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "localizationProb": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "score": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "value": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "sequenceWindow": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "FOUND_IN_PROTEIN": {
    "count": 204244,
    "properties": {
      "alignment": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "start": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "end": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HOSTED_BY": {
    "count": 25353190,
    "properties": {

    },
    "type": "relationship"
  },
  "SAME_AS": {
    "count": 1733155,
    "properties": {

    },
    "type": "relationship"
  },
  "Transcript": {
    "count": 280910,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "assembly": {
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
      "class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "taxid": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "TRANSCRIBED_INTO": {
        "count": 7264,
        "direction": "in",
        "labels": [
          "Gene"
        ],
        "properties": {

        }
      },
      "TRANSLATED_INTO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {

        }
      },
      "LOCATED_IN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Chromosome"
        ],
        "properties": {
          "start": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "strand": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "end": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "PARTICIPATES_IN": {
    "count": 13,
    "properties": {

    },
    "type": "relationship"
  },
  "CITANCE": {
    "count": 68065720,
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
  "ANNOTATED_IN_PATHWAY": {
    "count": 1203809,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "evidence": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "cellular_component": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "organism": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HAS_CONTRIBUTED_TO": {
    "count": 41885518,
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
    "count": 25386342,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_TOPIC": {
    "count": 80808031,
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
  "Venue": {
    "count": 37572,
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
        "count": 968,
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
  "Metabolite": {
    "count": 114222,
    "labels": [],
    "properties": {
      "direct_parent": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "average_molecular_weight": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "chebi_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "sub_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "kingdom": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "pubchem_compound_id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "super_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "chemical_formula": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "ASSOCIATED_WITH": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein",
          "Disease"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "ANNOTATED_IN_PATHWAY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Pathway"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "cellular_component": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "organism": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Drug": {
    "count": 15235,
    "labels": [],
    "properties": {
      "indication": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "Boiling_Point": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "Hydrophobicity": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "Melting_Point": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "absorption": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "toxicity": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "kingdom": {
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
      "Water_Solubility": {
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
      "pharmacodynamics": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "Molecular_Formula": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "groups": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "Isoelectric_Point": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "metabolism": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "community": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "subgraph": {
        "unique": false,
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false
      },
      "superclass": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "pKa": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "subclass": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "prices": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "caco2_Permeability": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "Molecular_Weight": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "CURATED_TARGETS": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Gene"
        ],
        "properties": {
          "response": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "disease": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "ACTS_ON": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "directionality": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          }
        }
      },
      "TARGETS_CLINICALLY_RELEVANT_VARIANT": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Clinically_relevant_variant"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "disease": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "COMPILED_TARGETS": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "scores": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "evidences": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          }
        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Publication",
          "Product"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "INTERACTS_WITH": {
        "count": 171607,
        "direction": "out",
        "labels": [
          "Drug",
          "Drug"
        ],
        "properties": {
          "interaction_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "MENTIONED_IN_PUBLICATION": {
    "count": 235945360,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "mapped": {
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Pid": {
    "count": 14889865,
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
        "count": 4,
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
    "count": 7013751,
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
      "impulse_class": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
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
      "SAME_AS": {
        "count": 957,
        "direction": "in",
        "labels": [
          "Publication"
        ],
        "properties": {

        }
      },
      "PUBLISHED_IN": {
        "count": 1144,
        "direction": "in",
        "labels": [
          "GWAS_study"
        ],
        "properties": {
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "CITANCE": {
        "count": 3822,
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
        "count": 11768,
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
        "count": 968,
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
      "FUNDED_BY": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 5046674,
        "direction": "in",
        "labels": [
          "Disease",
          "Tissue",
          "Cellular_component",
          "Protein",
          "Drug",
          "Functional_region"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
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
  "TARGETS_CLINICALLY_RELEVANT_VARIANT": {
    "count": 12530,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "evidence": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "disease": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Manifestation": {
    "count": 25386342,
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
        "type": "STRING",
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
        "count": 3298,
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
      }
    }
  },
  "Agent": {
    "count": 35675466,
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
        "count": 2865,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      },
      "HAS_BENEFICIARY": {
        "count": 1545,
        "direction": "in",
        "labels": [
          "Grant"
        ],
        "properties": {

        }
      },
      "HAS_FUNDING_AGENCY": {
        "count": 969,
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
  "CURATED_TARGETS": {
    "count": 20730,
    "properties": {
      "response": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "interaction_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "evidence": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "score": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "disease": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Known_variant": {
    "count": 10630108,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "external_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "effect": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "alternative_names": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "clinical_relevance": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "original_source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "disease": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "pvariant_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "VARIANT_FOUND_IN_CHROMOSOME": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Chromosome"
        ],
        "properties": {

        }
      },
      "VARIANT_FOUND_IN_GENE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Gene"
        ],
        "properties": {

        }
      },
      "VARIANT_FOUND_IN_GWAS": {
        "count": 0,
        "direction": "out",
        "labels": [
          "GWAS_study"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "odds_ratio": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "pvalue": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "frequency": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "trait": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "VARIANT_FOUND_IN_PROTEIN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {

        }
      }
    }
  },
  "Experimental_factor": {
    "count": 16147,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 437,
        "direction": "out",
        "labels": [
          "Experimental_factor",
          "Experimental_factor"
        ],
        "properties": {

        }
      },
      "STUDIES_TRAIT": {
        "count": 1440,
        "direction": "in",
        "labels": [
          "GWAS_study"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "MAPS_TO": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Disease",
          "Phenotype"
        ],
        "properties": {

        }
      }
    }
  },
  "HAS_STRUCTURE": {
    "count": 195640,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HAS_TECHNOLOGY": {
    "count": 1368389,
    "properties": {

    },
    "type": "relationship"
  },
  "INTERACTS_WITH": {
    "count": 2866522,
    "properties": {
      "interaction_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Technology": {
    "count": 1429,
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
        "count": 155,
        "direction": "in",
        "labels": [
          "Product"
        ],
        "properties": {

        }
      }
    }
  },
  "Experiment": {
    "count": 2829,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 1156,
        "direction": "out",
        "labels": [
          "Experiment",
          "Experiment"
        ],
        "properties": {

        }
      }
    }
  },
  "Modified_protein": {
    "count": 391057,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "position": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "source": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "protein": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "sequence_window": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "residue": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "IS_SUBSTRATE_OF": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "regulation": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "ASSOCIATED_WITH": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Biological_process",
          "Disease"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_QUANTIFIED_MODIFIED_PROTEIN": {
        "count": 224478,
        "direction": "in",
        "labels": [
          "Analytical_sample"
        ],
        "properties": {
          "deltaScore": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "scoreLocalization": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "is_razor": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "localizationProb": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "value": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "sequenceWindow": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_MODIFIED_SITE": {
        "count": 1663,
        "direction": "in",
        "labels": [
          "Protein",
          "Peptide"
        ],
        "properties": {

        }
      },
      "HAS_MODIFICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Modification"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "DETECTED_IN_PATHOLOGY_SAMPLE": {
    "count": 1697248,
    "properties": {
      "expression_high": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "negative_prognosis_logrank_pvalue": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "linkout": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "positive_prognosis_logrank_pvalue": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "expression_low": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "expression_medium": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "not_detected": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "ACTS_ON": {
    "count": 1278164,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "directionality": {
        "indexed": false,
        "type": "BOOLEAN",
        "existence": false,
        "array": false
      },
      "action": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "VARIANT_FOUND_IN_GENE": {
    "count": 10638935,
    "properties": {

    },
    "type": "relationship"
  },
  "ASSOCIATED_WITH": {
    "count": 16722721,
    "properties": {
      "number_publications": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "publications": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "action": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "evidence_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "IS_NEW_VERSION_OF": {
    "count": 1620,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_SEQUENCE": {
    "count": 20614,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "TRANSLATED_INTO": {
    "count": 374294,
    "properties": {

    },
    "type": "relationship"
  },
  "Tissue": {
    "count": 5897,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "description": {
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
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 457,
        "direction": "out",
        "labels": [
          "Tissue",
          "Tissue"
        ],
        "properties": {

        }
      },
      "ASSOCIATED_WITH": {
        "count": 68182,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Publication",
          "Product"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "STUDIES_TISSUE": {
        "count": 9,
        "direction": "in",
        "labels": [
          "Project"
        ],
        "properties": {

        }
      },
      "IS_QCMARKER_IN_TISSUE": {
        "count": 2,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "class": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "BELONGS_TO_PROTEIN": {
    "count": 3629058,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "HAS_QUANTIFIED_PROTEIN": {
    "count": 797651,
    "properties": {
      "qvalue": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "is_razor": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "intensity": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "value": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "proteinGroup": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "RELATED_TO": {
    "count": 3362,
    "properties": {
      "provenance": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "pearson": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "spearman": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "slope": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "MI": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "p_value": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "LOCATED_IN": {
    "count": 295912,
    "properties": {
      "start": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "strand": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "end": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "CITES": {
    "count": 97419854,
    "properties": {

    },
    "type": "relationship"
  },
  "Complex": {
    "count": 2700,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
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
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
        "existence": false
      },
      "organism": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "ASSOCIATED_WITH": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Biological_process"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_SUBUNIT_OF": {
        "count": 66,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "cell_lines": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "evidences": {
            "indexed": false,
            "type": "LIST",
            "existence": false,
            "array": true
          },
          "publication": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Phenotype": {
    "count": 15872,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 1232,
        "direction": "out",
        "labels": [
          "Phenotype",
          "Phenotype"
        ],
        "properties": {

        }
      },
      "MAPS_TO": {
        "count": 149,
        "direction": "in",
        "labels": [
          "Experimental_factor"
        ],
        "properties": {

        }
      }
    }
  },
  "Units": {
    "count": 442,
    "labels": [],
    "properties": {
      "id": {
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
      "name": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 354,
        "direction": "out",
        "labels": [
          "Units",
          "Units"
        ],
        "properties": {

        }
      }
    }
  },
  "HAS_BENEFICIARY": {
    "count": 371474,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_FUNDING_AGENCY": {
    "count": 246108,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_PART_OF": {
    "count": 9752,
    "properties": {

    },
    "type": "relationship"
  },
  "Analytical_sample": {
    "count": 172,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "external_id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "batch": {
        "unique": false,
        "indexed": false,
        "type": "INTEGER",
        "existence": false
      },
      "group": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "group2": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "HAS_QUANTIFIED_MODIFIED_PROTEIN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Modified_protein"
        ],
        "properties": {
          "deltaScore": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "scoreLocalization": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "is_razor": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "localizationProb": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "value": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "sequenceWindow": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_QUANTIFIED_PROTEIN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {
          "qvalue": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "is_razor": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "intensity": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "value": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "proteinGroup": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "SPLITTED_INTO": {
        "count": 172,
        "direction": "in",
        "labels": [
          "Biological_sample"
        ],
        "properties": {

        }
      }
    }
  },
  "GWAS_study": {
    "count": 8713,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "title": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "sample_size": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "replication_size": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "date": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "trait": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      }
    },
    "type": "node",
    "relationships": {
      "VARIANT_FOUND_IN_GWAS": {
        "count": 1,
        "direction": "in",
        "labels": [
          "Known_variant"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "odds_ratio": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "pvalue": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "frequency": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "trait": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "PUBLISHED_IN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product",
          "Publication"
        ],
        "properties": {
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "STUDIES_TRAIT": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Experimental_factor"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "Disease": {
    "count": 11465,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "description": {
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
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 2214,
        "direction": "out",
        "labels": [
          "Disease",
          "Disease"
        ],
        "properties": {

        }
      },
      "DETECTED_IN_PATHOLOGY_SAMPLE": {
        "count": 7232,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "expression_high": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "negative_prognosis_logrank_pvalue": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "linkout": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "positive_prognosis_logrank_pvalue": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "expression_low": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "expression_medium": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "not_detected": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "ASSOCIATED_WITH": {
        "count": 68182,
        "direction": "in",
        "labels": [
          "Protein",
          "Modified_protein",
          "Clinically_relevant_variant",
          "Metabolite"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "STUDIES_DISEASE": {
        "count": 13,
        "direction": "in",
        "labels": [
          "Project"
        ],
        "properties": {

        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Product",
          "Publication"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      },
      "IS_BIOMARKER_OF_DISEASE": {
        "count": 4,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "age_units": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "normal_range": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "is_used_in_clinic": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          },
          "sex": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "assay": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "is_routine": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          },
          "notes": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "reference": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "age_range": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "units": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "MAPS_TO": {
        "count": 149,
        "direction": "in",
        "labels": [
          "Experimental_factor"
        ],
        "properties": {

        }
      }
    }
  },
  "VARIANT_FOUND_IN_GWAS": {
    "count": 16128,
    "properties": {
      "source": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "odds_ratio": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "pvalue": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "frequency": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      },
      "trait": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "Peptide": {
    "count": 1001105,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": false,
        "type": "STRING",
        "existence": false
      },
      "unique": {
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
      "BELONGS_TO_PROTEIN": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Protein"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "HAS_MODIFIED_SITE": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Modified_protein"
        ],
        "properties": {

        }
      }
    }
  },
  "IS_SUPPLEMENTED_BY": {
    "count": 170913,
    "properties": {

    },
    "type": "relationship"
  },
  "COMPILED_INTERACTS_WITH": {
    "count": 1956612,
    "properties": {
      "interaction_type": {
        "indexed": false,
        "type": "STRING",
        "existence": false,
        "array": false
      },
      "source": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "scores": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "evidence": {
        "indexed": false,
        "type": "LIST",
        "existence": false,
        "array": true
      },
      "score": {
        "indexed": false,
        "type": "FLOAT",
        "existence": false,
        "array": false
      }
    },
    "type": "relationship"
  },
  "CURATED_AFFECTS_INTERACTION_WITH": {
    "count": 10873,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_RELEVANT_TO": {
    "count": 22667404,
    "properties": {

    },
    "type": "relationship"
  },
  "Cellular_component": {
    "count": 4228,
    "labels": [],
    "properties": {
      "id": {
        "unique": false,
        "indexed": true,
        "type": "STRING",
        "existence": false
      },
      "description": {
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
      "synonyms": {
        "unique": false,
        "indexed": false,
        "type": "LIST",
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
      "HAS_PARENT": {
        "count": 1718,
        "direction": "out",
        "labels": [
          "Cellular_component",
          "Cellular_component"
        ],
        "properties": {

        }
      },
      "ASSOCIATED_WITH": {
        "count": 68182,
        "direction": "in",
        "labels": [
          "Protein"
        ],
        "properties": {
          "number_publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "publications": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "score": {
            "indexed": false,
            "type": "FLOAT",
            "existence": false,
            "array": false
          },
          "action": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "evidence_type": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          }
        }
      },
      "MENTIONED_IN_PUBLICATION": {
        "count": 0,
        "direction": "out",
        "labels": [
          "Publication",
          "Product"
        ],
        "properties": {
          "source": {
            "indexed": false,
            "type": "STRING",
            "existence": false,
            "array": false
          },
          "mapped": {
            "indexed": false,
            "type": "BOOLEAN",
            "existence": false,
            "array": false
          }
        }
      }
    }
  },
  "HAS_RESEARCH_ARTIFACT": {
    "count": 1772343,
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
  "MAPS_TO": {
    "count": 2375,
    "properties": {

    },
    "type": "relationship"
  },
  "SPLITTED_INTO": {
    "count": 172,
    "properties": {

    },
    "type": "relationship"
  },
  "IS_DOCUMENTED_BY": {
    "count": 49715,
    "properties": {

    },
    "type": "relationship"
  },
  "HAS_PID": {
    "count": 14908863,
    "properties": {

    },
    "type": "relationship"
  }
}