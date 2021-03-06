#!/bin/bash -f
#
# This shell script is used to invoke the Latex_Makefile for general 
# documents. It should be copied into the individual document directory
# as a new document is created. It is used to pass document specific 
# parameters to the makefile. NOTE that if parameters may be omitted
# by simply deleting them from the "make" command line.
#
# Usage:
#   Latex_make.sh [makefile_options] 
# Created:
#   Martyn Nash, 22 March 1996
# Updates:
#
# Changable options:
#
# This is the overall name of the document

MY_MAINFILE=OpenCMISSNotes

#
# These are the names of the tex sources for the document. If there is
# more than one source quotation (") marks must be used around the
# individual sources seperated by spaces.

MY_TEX_SRC="TitlePage/TitlePage.tex "\
"Introduction/Introduction.tex "\
"BasisFunctions/BasisFunctions.tex "\
"DifferentialGeometry/DifferentialGeometry.tex "\
"Theory/Theory.tex "\
"Maths/Maths.tex "\
"Maths/Notation/Notation.tex "\
"Maths/VectorCalculus/VectorCalculus.tex "\
"Maths/Operations/Operations.tex "\
"EquationSets/EquationSets.tex "\
"EquationSets/ClassicalFieldClass/AdvectionDiffusionEquation.tex "\
"EquationSets/ClassicalFieldClass/GeneralisedLaplaceEquation.tex "\
"EquationSets/ClassicalFieldClass/BiharmonicEquation.tex "\
"EquationSets/ClassicalFieldClass/DiffusionEquation.tex "\
"EquationSets/ClassicalFieldClass/HelmholtzEquation.tex "\
"EquationSets/ClassicalFieldClass/PoissonEquation.tex "\
"EquationSets/ClassicalFieldClass/ReactionDiffusionEquation.tex "\
"EquationSets/ClassicalFieldClass/WaveEquation.tex "\
"EquationSets/ElasticityClass/LinearElasticity.tex "\
"EquationSets/ElasticityClass/FiniteElasticity.tex "\
"EquationSets/FluidMechanicsClass/BurgersEquation.tex "\
"EquationSets/FluidMechanicsClass/PoiseuilleFlow.tex "\
"EquationSets/FluidMechanicsClass/StokesEquation.tex "\
"EquationSets/FluidMechanicsClass/DarcyEquation.tex "\
"EquationSets/FluidMechanicsClass/NavierStokesEquation.tex "\
"EquationSets/FluidMechanicsClass/PressurePoissonEquation.tex "\
"EquationSets/FluidMechanicsClass/FiniteVolume.tex "\
"EquationSets/MultiphysicsClass/Poroelasticity.tex "\
"EquationSets/MultiphysicsClass/FSI.tex "\
"EquationSets/FittingClass/Fitting.tex "\
"EquationSets/FittingClass/DataProjection.tex "\
"AnalyticSolutions/AnalyticSolutions.tex "\
"AnalyticSolutions/ClassicalFieldClass/GeneralisedLaplaceEquation.tex "\
"AnalyticSolutions/ClassicalFieldClass/DiffusionEquation.tex "\
"AnalyticSolutions/FluidMechanicsClass/BurgersEquation.tex "\
"Appendices/Appendices.tex "\
"Appendices/CoordinateSystems.tex "\
"References/References.tex "\
"Index/Index.tex"

#
# The names of the eps/figs/(gnu)plot files that go into the document. 
# if there are none then leave after the ='s sign blank. If there is
# more than one source quotation (") marks must be used around the
# individual sources seperated by spaces.

MY_EPS_SRC="epsfiles/Modules/*.eps"
MY_FIG_SRC=figs/BasisFunctions/*.fig
MY_SVG_SRC="svgs/BasisFunctions/*.svg "\
    "svgs/DifferentialGeometry/*.svg "\
    "svgs/Analytic/*.svg "\
    "svgs/EquationsSets/Elasticity/FiniteElasticity/*.svg "\
    "svgs/EquationsSets/FluidMechanics/NavierStokes/*.svg "\
    "svgs/EquationsSets/Fitting/*.svg "
MY_PLOT_SRC="plots/BasisFunctions/*.gnu plots/BasisFunctions/*.gnu8"

#
# The name of the directory to place the html version of the document.
# Note that the actual file will be placed in the directory
# MY_HTMLUPDATE_DIR/MY_MAINFILE with filename index.html

MY_HTMLUPDATE_DIR=${OPENCMISS_ROOT}/www/help

#
# This next option controls the type of backlinks to add to the footer
# of the HTML file. It should be "user" if the document is intended for
# general users or "programmer" if the document is intended for 
# cmiss programmers. If no backlinks are required use "none".

MY_HTMLIDXTYPE=user

#
# The name of the bibliography database for the document

MY_BIBS=${OPENCMISS_ROOT}/documentation/notes/references/opencmiss_references.bib

#
# The name of the printer to print the document to

MY_PRINTER=laserjet_postscript

#
# Below this line should not need changing
#
# Actual make command:
#
make -f ${OPENCMISS_ROOT}/documentation/notes/latex/Latex_Makefile $* \
	MAINFILE=$MY_MAINFILE \
	TEX_SRC="$MY_TEX_SRC" \
	EPS_SRC="$MY_EPS_SRC" \
	FIG_SRC="$MY_FIG_SRC" \
	SVG_SRC="$MY_SVG_SRC" \
	PLOT_SRC="$MY_PLOT_SRC" \
	HTMLUPDATE_DIR=$MY_HTMLUPDATE_DIR \
	HTMLIDXTYPE=$MY_HTMLIDXTYPE \
	BIBS=$MY_BIBS \
	PRINTER=$MY_PRINTER
