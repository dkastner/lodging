Feature: Lodging Committee Calculations
  The lodging model should generate correct committee calculations

  Scenario: Rooms committee from default
    Given a lodging emitter
    When the "rooms" committee is calculated
    Then the committee should have used quorum "default"
    And the conclusion of the committee should be "1"

  Scenario: Nights committee from default
    Given a lodging emitter
    When the "nights" committee is calculated
    Then the committee should have used quorum "default"
    And the conclusion of the committee should be "1"

  Scenario: State committee from zip code
    Given a lodging emitter
    And a characteristic "zip_code.name" of "94122"
    When the "state" committee is calculated
    Then the committee should have used quorum "from zip code"
    And the conclusion of the committee should have "postal_abbreviation" of "CA"

  Scenario: Census division committee from state
    Given a lodging emitter
    And a characteristic "state.postal_abbreviation" of "CA"
    When the "census_division" committee is calculated
    Then the committee should have used quorum "from state"
    And the conclusion of the committee should have "number" of "9"

  Scenario: Lodging class committee from nothing
    Given a lodging emitter
    When the "lodging_class" committee is calculated
    Then the committee should have used quorum "default"
    And the conclusion of the committee should have "name" of "Average"

  Scenario: District heat intensity committee from nothing
    Given a lodging emitter
    When the "lodging_class" committee is calculated
    And the "district_heat_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "10000000"

  Scenario: District heat intensity committee from lodging class
    Given a lodging emitter
    And a characteristic "lodging_class.name" of "Luxury Hotel"
    When the "district_heat_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "20000000"

  Scenario: District heat intensity committee from census division
    Given a lodging emitter
    And a characteristic "census_division.number" of "9"
    When the "district_heat_intensity" committee is calculated
    Then the committee should have used quorum "from census division"
    And the conclusion of the committee should be "1000"

  Scenario: Electricity intensity committee from nothing
    Given a lodging emitter
    When the "lodging_class" committee is calculated
    And the "electricity_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "5"

  Scenario: Electricity intensity committee from lodging class
    Given a lodging emitter
    And a characteristic "lodging_class.name" of "Luxury Hotel"
    When the "electricity_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "10"

  Scenario: Electricity intensity committee from census division
    Given a lodging emitter
    And a characteristic "census_division.number" of "9"
    When the "electricity_intensity" committee is calculated
    Then the committee should have used quorum "from census division"
    And the conclusion of the committee should be "3"

  Scenario: Fuel oil intensity committee from nothing
    Given a lodging emitter
    When the "lodging_class" committee is calculated
    And the "fuel_oil_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "0.5"

  Scenario: Fuel oil intensity committee from lodging class
    Given a lodging emitter
    And a characteristic "lodging_class.name" of "Luxury Hotel"
    When the "fuel_oil_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "1"

  Scenario: Fuel oil intensity committee from census division
    Given a lodging emitter
    And a characteristic "census_division.number" of "9"
    When the "fuel_oil_intensity" committee is calculated
    Then the committee should have used quorum "from census division"
    And the conclusion of the committee should be "2"

  Scenario: Natural gas intensity committee from nothing
    Given a lodging emitter
    When the "lodging_class" committee is calculated
    And the "natural_gas_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "1"

  Scenario: Natural gas intensity committee from lodging class
    Given a lodging emitter
    And a characteristic "lodging_class.name" of "Luxury Hotel"
    When the "natural_gas_intensity" committee is calculated
    Then the committee should have used quorum "from lodging class"
    And the conclusion of the committee should be "2"

  Scenario: Natural gas intensity committee from census division
    Given a lodging emitter
    And a characteristic "census_division.number" of "9"
    When the "natural_gas_intensity" committee is calculated
    Then the committee should have used quorum "from census division"
    And the conclusion of the committee should be "1"

  Scenario: Emission factor committee from nothing
    Given a lodging emitter
    When the "lodging_class" committee is calculated
    And the "district_heat_intensity" committee is calculated
    And the "electricity_intensity" committee is calculated
    And the "fuel_oil_intensity" committee is calculated
    And the "natural_gas_intensity" committee is calculated
    And the "emission_factor" committee is calculated
    Then the committee should have used quorum "from fuel intensities"
    And the conclusion of the committee should be "11.24496"

  Scenario: Emission factor committee from lodging class
    Given a lodging emitter
    And a characteristic "lodging_class.name" of "Luxury Hotel"
    When the "district_heat_intensity" committee is calculated
    And the "electricity_intensity" committee is calculated
    And the "fuel_oil_intensity" committee is calculated
    And the "natural_gas_intensity" committee is calculated
    And the "emission_factor" committee is calculated
    Then the committee should have used quorum "from fuel intensities"
    And the conclusion of the committee should be "22.48991"

  Scenario: Emission factor committee from census division
    Given a lodging emitter
    And a characteristic "census_division.number" of "9"
    When the "district_heat_intensity" committee is calculated
    And the "electricity_intensity" committee is calculated
    And the "fuel_oil_intensity" committee is calculated
    And the "natural_gas_intensity" committee is calculated
    And the "emission_factor" committee is calculated
    Then the committee should have used quorum "from fuel intensities"
    And the conclusion of the committee should be "8.50002"
