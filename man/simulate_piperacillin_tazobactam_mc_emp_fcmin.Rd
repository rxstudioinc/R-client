% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_piperacillin_tazobactam_mc_emp_fcmin.R
\name{simulate_piperacillin_tazobactam_mc_emp_fcmin}
\alias{simulate_piperacillin_tazobactam_mc_emp_fcmin}
\title{Piperacillin & Tazobactam » Empiric » fCmin}
\usage{
simulate_piperacillin_tazobactam_mc_emp_fcmin(
  PATID,
  AGE,
  HEIGHT,
  WEIGHT,
  GENDER,
  CREATININE,
  MODEL,
  MIC,
  CMIN,
  LOADINGDOSE,
  CRCLCAP,
  REGIMENS
)
}
\arguments{
\item{PATID}{Patient Identifier. User-provided free text (such as patient id, name or alias) to identify related simulations. Must be provided as string.}

\item{AGE}{Age. Age of the patient in years. Must be provided as numeric (min. 18, max. 120 year).}

\item{HEIGHT}{Height. Height of the patient. Must be provided as numeric (min. 100, max. 250 cm).}

\item{WEIGHT}{Weight. Actual body weight of the patient. Must be provided as numeric (min. 20, max. 500 kg).}

\item{GENDER}{Sex. Patient's sex for clinical decision-making. Must be provided as string ('Male' or 'Female').}

\item{CREATININE}{Creatinine. Serum creatinine. Must be provided as numeric (min. 0.01, max. 15 mg/dL).}

\item{MODEL}{Model for population of interest. Pharmacokinetic model to be used for specific patient type during simulations. Must be provided as string ('Felton et al. (2014) - ICU' or 'Patel et. al. (2010) - General ward').}

\item{MIC}{MIC. Minimum Inhibitory Concentration (MIC). Must be provided as numeric (min. 0.01, max. 1024 mg/L).}

\item{CMIN}{Minimum concentration target. The PK/PD target can be provided as minimum blood plasma concentration (Cmin). Must be provided as numeric (min. 0.1, max. 200 mg/L).}

\item{LOADINGDOSE}{Loading dose. Loading dose is desired or not. Must be provided as string ('No' or 'Yes').}

\item{CRCLCAP}{Capping Creatinine Clearance. Whether to use capping for creatinine clearance. Must be provided as string ('No cap', '120 ml/min', '130 ml/min', '140 ml/min' or '150 ml/min').}

\item{REGIMENS}{Dosing Regimens. List of dosing regimens to be used in simulating target attainment, from which the dosing regimen with the smallest absolute difference from the desired target will be automatically selected. Must be provided as list of 1-20 'REGIMEN' values. Use the \code{regimen} helper function to define the REGIMEN values.}
}
\description{
Piperacillin & Tazobactam » Empiric therapy » Free minimum concentration
}
\details{
\strong{Drug}:
Piperacillin & Tazobactam

\strong{Method}:
Simulate concentrations for multiple dosing regimens and select the optimal one, with regard to the target pharmacodynamic index.

\strong{PK/PD target}:
Free minimum blood plasma concentration (mg/L).
}
\examples{
\dontrun{
simulate_piperacillin_tazobactam_mc_emp_fcmin(PATID = "Anonymous", 
    AGE = 65, HEIGHT = 175, 
    WEIGHT = 75, GENDER = "Male", 
    CREATININE = 1, MODEL = "Felton et al. (2014) - ICU", 
    MIC = 1, CMIN = 4, 
    LOADINGDOSE = "No", 
    CRCLCAP = "No cap", 
    REGIMENS = list(list(
        set = "REGIMEN", 
        DOSE = 2250, 
        INTERVAL = 4, 
        TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 2250, 
            INTERVAL = 6, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 2250, 
            INTERVAL = 8, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 3375, 
            INTERVAL = 4, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 3375, 
            INTERVAL = 6, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 3375, 
            INTERVAL = 8, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 4500, 
            INTERVAL = 4, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 4500, 
            INTERVAL = 6, 
            TINF = 0.5), 
        list(set = "REGIMEN", 
            DOSE = 4500, 
            INTERVAL = 8, 
            TINF = 0.5)))
}

}
\references{
\itemize{
  \item Felton, T. W. et al. (2014): Individualization of Piperacillin Dosing for Critically Ill Patients: Dosing Software To Optimize Antimicrobial Therapy. In. Antimicrobial Agents and Chemotherapy. https://aac.asm.org/content/58/7/4094
  \item Patel, N. et al. (2010): Identification of Optimal Renal Dosage Adjustments for Traditional and Extended-Infusion Piperacillin-Tazobactam Dosing Regimens in Hospitalized Patients. In. Antimicrobial Agents and Chemotherapy. https://aac.asm.org/content/54/1/460
}
}
