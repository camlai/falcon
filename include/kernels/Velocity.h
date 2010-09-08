#ifndef VELOCITY_H
#define VELOCITY_H

#include "Kernel.h"
#include "Material.h"


//ForwardDeclarations
class Velocity;

template<>
InputParameters validParams<Velocity>();

class Velocity : public Kernel
{
public:

  Velocity(const std::string & name, MooseSystem & moose_system, InputParameters parameters);
  
protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  unsigned int _p_var;
  VariableValue & _p;

  unsigned int _momentum_var;
  VariableValue & _momentum;

  Real _acceleration;
};
 
#endif
