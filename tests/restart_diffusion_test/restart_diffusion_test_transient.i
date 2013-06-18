[Mesh]
  type = FileMesh
  dim = 2
  file = steady_out.e
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
    initial_from_file_var = u
    initial_from_file_timestep = 2
  [../]
[]

[Kernels]
  [./bodyforce]
    type = BodyForce
    variable = u
    value = 10.0
  [../]
  [./ie]
    type = TimeDerivative
    variable = u
  [../]
[]

[BCs]
  [./left]
    type = DirichletBC
    variable = u
    boundary = left
    value = 0
  [../]
  [./right]
    type = DirichletBC
    variable = u
    boundary = right
    value = 1
  [../]
[]

[Materials]
  [./constant]
    type = Constant
    block = 0
  [../]
[]

[Executioner]
  type = Transient
  petsc_options = -snes_mf_operator
  start_time = 0.0
  num_steps = 10
  dt = .1
[]

[Output]
  file_base = out
  output_initial = true
  interval = 1
  exodus = true
  perf_log = true
[]

