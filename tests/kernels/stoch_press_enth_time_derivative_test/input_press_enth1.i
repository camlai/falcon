[Mesh]
  file = stochastic_rock.e
[]

[Variables]
  [./pressure]
    order = FIRST
    family = LAGRANGE
    initial_condition = 10e6
  [../]
  [./enthalpy]
    order = FIRST
    family = LAGRANGE
    initial_condition = 850000
  [../]
[]

[AuxVariables]
  [./permeability]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./temperature]
    order = FIRST
    family = LAGRANGE
  [../]
  [./saturation]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[Kernels]
  [./p_td]
    type = MassFluxTimeDerivative
    variable = pressure
    enthalpy = enthalpy
  [../]
  [./p_wmfp]
    type = WaterMassFluxPressure
    variable = pressure
    enthalpy = enthalpy
  [../]
  [./p_smfp]
    type = SteamMassFluxPressure
    variable = pressure
    enthalpy = enthalpy
  [../]
  [./t_td]
    type = EnthalpyTimeDerivative
    variable = enthalpy
    pressure = pressure
  [../]
  [./t_d]
    type = EnthalpyDiffusion
    variable = enthalpy
    pressure = pressure
    temperature = temperature
  [../]
  [./t_cw]
    type = EnthalpyConvectionWater
    variable = enthalpy
    pressure = pressure
  [../]
  [./t_cs]
    type = EnthalpyConvectionSteam
    variable = enthalpy
    pressure = pressure
  [../]
[]

[AuxKernels]
  [./aux_permeability]
    type = StochasticFieldAux
    variable = permeability
    file_name = stochastic_perm_field.txt
  [../]
  [./temperature]
    type = CoupledTemperatureAux
    variable = temperature
    pressure = pressure
    enthalpy = enthalpy
    water_steam_properties = water_steam_properties
  [../]
  [./saturation]
    type = MaterialRealAux
    variable = saturation
    property = saturation_water
  [../]
[]

[BCs]
  [./right_p]
    type = DirichletBC
    variable = pressure
    boundary = 1
    value = 10e6
  [../]
  [./right_t]
    type = DirichletBC
    variable = enthalpy
    boundary = 1
    value = 850000
  [../]
  [./left_p]
    type = DirichletBC
    variable = pressure
    boundary = 2
    value = 9e6
  [../]
  [./left_t]
    type = DirichletBC
    variable = enthalpy
    boundary = 2
    value = 800000
  [../]
[]

[Materials]
  [./rock]
    type = StochasticGeothermal
    block = 1
    pressure = pressure
    enthalpy = enthalpy
    water_steam_properties = water_steam_properties
    permeability = permeability
    gravity = 0.0
    gx = 0.0
    gy = 0.0
    gz = 1.0
    porosity = 0.3
    thermal_conductivity = 2.5
    specific_heat_water = 4186
    specific_heat_rock = 920
  [../]
[]

[UserObjects]
  [./water_steam_properties]
    type = WaterSteamEOS
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  # nl_abs_tol = 1e-6
  type = Transient
  num_steps = 150
  dt = 100000.0
  [./Quadrature]
    type = Trap
  [../]
[]

[Output]
  file_base = out_press_enth1
  output_initial = true
  interval = 1
  exodus = true
  print_out_info = true
[]

