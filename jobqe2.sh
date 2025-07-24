#!/bin/bash
#SBATCH -A che240225         # Allocation name
#SBATCH -t 1:00:00              # Time limit
#SBATCH -N 1                    # Number of nodes
#SBATCH -n 1                    # Total tasks
#SBATCH -c 8                    # Cores per task
#SBATCH --job-name=quantum_espresso/7.3
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --error=%x-%J-%u.err
#SBATCH --output=%x-%J-%u.out

# Load environment
module --force purge
module load gcc/11.2.0 openmpi/4.1.6
module load quantum-espresso/7.3

# Step 1: Run SCF calculation
echo "Running pp.x (SCF)..."
mpirun -np 1 pp.x < rho_112.in > rho_112.out

echo "job complete"
