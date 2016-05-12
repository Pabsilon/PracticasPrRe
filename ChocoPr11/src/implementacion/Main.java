package implementacion;

//Pablo Mac-Veigh
//David Quesada

import org.chocosolver.solver.Solver;
import org.chocosolver.solver.constraints.IntConstraintFactory;
import org.chocosolver.solver.variables.IntVar;
import org.chocosolver.solver.variables.VariableFactory;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solver solver = new Solver("Práctica 11");
		IntVar[] as = VariableFactory.enumeratedArray("as", 4, 0, 3, solver);
		IntVar[] bs = VariableFactory.enumeratedArray("bs", 4, 2, 5, solver);
		int[] coeffs = {1,2,3,4};
		IntVar ar = VariableFactory.bounded("ar", 0, 20, solver);
		IntVar br = VariableFactory.bounded("br", 0, 20, solver);
		for (int i = 0; i<4; i++){
			solver.post(IntConstraintFactory.arithm(as[i], "!=", bs[i]));
		}
		
		solver.post(IntConstraintFactory.scalar(as, coeffs, ar));
		solver.post(IntConstraintFactory.scalar(bs, coeffs, br));
		
		solver.post(IntConstraintFactory.arithm(ar, "=", br));
		
		if (solver.findSolution()){
			for (int i = 0; i<4;i++){
				System.out.println(as[i]);
			}
			for (int i = 0; i<4;i++){
				System.out.println(bs[i]);
			}
			while (solver.nextSolution()){
				for (int i = 0; i<4;i++){
					System.out.println(as[i]);
				}
				for (int i = 0; i<4;i++){
					System.out.println(bs[i]);
				}
			}
		}
	}
}
