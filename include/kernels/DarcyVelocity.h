#ifndef DARCYVELOCITY_H
#define DARCYVELOCITY_H

#include "Kernel.h"
#include "Material.h"


//ForwardDeclarations
class DarcyVelocity;

template<>
InputParameters validParams<DarcyVelocity>();

class DarcyVelocity : public Kernel
{
public:

  DarcyVelocity(const std::string & name, MooseSystem & moose_system, InputParameters parameters);
  

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  int _component;
  MaterialProperty<RealGradient> &_pore_velocity_w;

private:
};
 
#endif
