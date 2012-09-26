/****************************************************************/
/*             DO NOT MODIFY OR REMOVE THIS HEADER              */
/*          FALCON - Fracturing And Liquid CONvection           */
/*                                                              */
/*       (c) pending 2012 Battelle Energy Alliance, LLC         */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#include "TimeDerivative.h"

#ifndef MASSFLUXTIMEDERIVATIVE_PT
#define MASSFLUXTIMEDERIVATIVE_PT

//Forward Declarations
class MassFluxTimeDerivative_PT;

template<>
InputParameters validParams<MassFluxTimeDerivative_PT>();

class MassFluxTimeDerivative_PT : public TimeDerivative
{
public:

  MassFluxTimeDerivative_PT(const std::string & name, InputParameters parameters);

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

    MaterialProperty<Real> & _density_water;
    MaterialProperty<Real> & _density_water_old;
    MaterialProperty<Real> & _dwdp;
    MaterialProperty<Real> & _porosity;  
//  VariableValue  & _porosity;
//  VariableValue  & _porosity_old;

};
#endif //MASSFLUXTIMEDERIVATIVE_PT
