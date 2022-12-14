

K=10
T=4
APX=2.5
REFERENCE="ref1"
JOB_PATH="./Class3D/K${K}_T${T}_${APX}Apx_${REFERENCE}/run_it025_model.star"

echo "Proportion of all particles in each class..."
relion_star_printtable $JOB_PATH data_model_classes rlnClassDistribution
echo "Average accuracy of the class's particle orientation alignments to the referance image (lower is more accurate)..."
relion_star_printtable $JOB_PATH data_model_classes rlnAccuracyRotations

