
const double relativeBorderRadius = 0.05;
double borderRadiusFromSides(double width,double height){
  double smallest = width;
  if (height<smallest){height = smallest;}
  return smallest * relativeBorderRadius;
}