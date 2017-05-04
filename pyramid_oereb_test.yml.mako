pyramid_oereb:

  language:
    - de
    - fr
    - it
    - rm

  flavour:
    - REDUCED
    - FULL
    - EMBEDDABLE

  app_schema:
    name: pyramid_oereb_main
    models: pyramid_oereb.standard.models.main
    db_connection: ${sqlalchemy_url}

  plr_cadastre_authority:
    name: PLR cadastre authority
    office_at_web: https://www.cadastre.ch/en/oereb.html
    street: Seftigenstrasse
    number: 264
    postal_code: 3084
    city: Wabern

  logo:
    confederation: logo_der_schweizerischen_eidgenossenschaft.png
    oereb: logo_suisse.png
    canton: BL_Logo_B_r_rgb.png

  real_estate:
    source:
      class: pyramid_oereb.lib.sources.real_estate.RealEstateDatabaseSource
      params:
        db_connection: ${sqlalchemy_url}
        model: pyramid_oereb.models.PyramidOerebMainRealEstate

  address:
    source:
      class: pyramid_oereb.lib.sources.address.AddressDatabaseSource
      params:
        db_connection: ${sqlalchemy_url}
        model: pyramid_oereb.models.PyramidOerebMainAddress

  municipality:
    source:
      class: pyramid_oereb.lib.sources.municipality.MunicipalityDatabaseSource
      params:
        db_connection: ${sqlalchemy_url}
        model: pyramid_oereb.models.PyramidOerebMainMunicipality

  glossary:
    source:
      class: pyramid_oereb.lib.sources.glossary.GlossaryDatabaseSource
      params:
        db_connection: ${sqlalchemy_url}
        model: pyramid_oereb.models.PyramidOerebMainGlossary

  exclusion_of_liability:
    source:
      class: pyramid_oereb.lib.sources.exclusion_of_liability.ExclusionOfLiabilityDatabaseSource
      params:
        db_connection: ${sqlalchemy_url}
        model: pyramid_oereb.models.PyramidOerebMainExclusionOfLiability

  plrs:

    - name: plr73
      code: LandUsePlans
      geometry_type: LINESTRING
      label: Nutzungsplanung
      language: de
      standard: true
      source:
        class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
        params:
          db_connection: ${sqlalchemy_url}
          models: pyramid_oereb.standard.models.land_use_plans

    - name: plr87
      code: MotorwaysProjectPlaningZones
      geometry_type: LINESTRING
      label: Projektierungszonen Nationalstrassen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.motorways_project_planing_zones

    - name: plr88
      code: MotorwaysBuildingLines
      geometry_type: LINESTRING
      label: Baulinien Nationalstrassen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.motorways_building_lines

    - name: plr97
      code: RailwaysBuildingLines
      geometry_type: LINESTRING
      label: Baulinien Eisenbahnanlagen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.railways_building_lines

    - name: plr96
      code: RailwaysProjectPlanningZones
      geometry_type: POLYGON
      label: Projektierungszonen Eisenbahnanlagen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.railways_project_planning_zones

    - name: plr103
      code: AirportsProjectPlanningZones
      geometry_type: POLYGON
      label: Projektierungszonen Flughafenanlagen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.airports_project_planning_zones

    - name: plr104
      code: AirportsBuildingLines
      geometry_type: POLYGON
      label: Baulinien Flughafenanlagen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.airports_building_lines

    - name: plr108
      code: AirportsSecurityZonePlans
      geometry_type: POLYGON
      label: Sicherheitszonenplan Flughafen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.airports_security_zone_plans

    - name: plr116
      code: ContaminatedSites
      geometry_type: POLYGON
      label: Belastete Standorte
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.contaminated_sites

    - name: plr117
      code: ContaminatedMilitarySites
      geometry_type: POLYGON
      label: Belastete Standorte Militär
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.contaminated_military_sites

    - name: plr118
      code: ContaminatedCivilAviationSites
      geometry_type: POLYGON
      label: Belastete Standorte Zivile Flugplätze
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.contaminated_civil_aviation_sites

    - name: plr119
      code: ContaminatedPublicTransportSites
      geometry_type: POLYGON
      label: Belastete Standorte Öeffentlicher Verkehr
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.contaminated_public_transport_sites

    - name: plr131
      code: GroundwaterProtectionZones
      geometry_type: POLYGON
      label: Grundwasserschutzzonen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.groundwater_protection_zones

    - name: plr132
      code: GroundwaterProtectionSites
      geometry_type: POLYGON
      label: Grundwasserschutzareale
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.groundwater_protection_sites

    - name: plr145
      code: NoiseSensitivityLevels
      geometry_type: POLYGON
      label: Lärmemfindlichkeitsstufen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.noise_sensitivity_levels

    - name: plr157
      code: ForestPerimeters
      geometry_type: POLYGON
      label: Waldgrenzen
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.forest_perimeters

    - name: plr159
      code: ForestDistanceLines
      geometry_type: POLYGON
      label: Waldabstandslinien
      language: de
      standard: true
      source:
         class: pyramid_oereb.lib.sources.plr.PlrStandardDatabaseSource
         params:
           db_connection: ${sqlalchemy_url}
           models: pyramid_oereb.standard.models.forest_distance_lines

  srid: 2056
  db_connection: ${sqlalchemy_url}