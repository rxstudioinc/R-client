% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_cefepime_mc_emp_fauc_mic_ratio.R
\name{simulate_cefepime_mc_emp_fauc_mic_ratio}
\alias{simulate_cefepime_mc_emp_fauc_mic_ratio}
\title{Cefepime » Empiric » fAUC/MIC}
\usage{
simulate_cefepime_mc_emp_fauc_mic_ratio(
  PATID,
  AGE,
  HEIGHT,
  WEIGHT,
  GENDER,
  CREATININE,
  MODEL,
  MIC,
  AUCPERMIC,
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

\item{MODEL}{Model for population of interest. Pharmacokinetic model to be used for specific patient type during simulations. Must be provided as string ('Nicasio et al. (2009) - ICU' or 'Tam et al. (2003) - General ward').}

\item{MIC}{MIC. Minimum Inhibitory Concentration (MIC). Must be provided as numeric (min. 0.01, max. 1024 mg/L).}

\item{AUCPERMIC}{AUC to MIC ratio target. The PK/PD target can be provided as 24 hour area under the concentration-time curve to minimum inhibitory concentration ratio (AUC/MIC). Must be provided as numeric (min. 10, max. 2000 ).}

\item{LOADINGDOSE}{Loading dose. Loading dose is desired or not. Must be provided as string ('No' or 'Yes').}

\item{CRCLCAP}{Capping Creatinine Clearance. Whether to use capping for creatinine clearance. Must be provided as string ('No cap', '120 ml/min', '130 ml/min', '140 ml/min' or '150 ml/min').}

\item{REGIMENS}{Dosing Regimens. List of dosing regimens to be used in simulating target attainment, from which the dosing regimen with the smallest absolute difference from the desired target will be automatically selected. Must be provided as list of 1-20 'REGIMEN' values. Use the \code{regimen} helper function to define the REGIMEN values.}
}
\description{
Cefepime » Empiric therapy » fAUC to MIC ratio
}
\details{
\strong{Drug}:
Cefepime

\strong{Method}:
Simulate concentrations for multiple dosing regimens and select the optimal one, with regard to the target pharmacodynamic index.

\strong{PK/PD target}:
24 hour area under the free concentration-time curve to minimum inhibitory concentration ratio.
}
\examples{
\dontrun{
simulate_cefepime_mc_emp_fauc_mic_ratio(PATID = "Anonymous", 
    AGE = 65, HEIGHT = 175, 
    WEIGHT = 75, GENDER = "Male", 
    CREATININE = 0.876056338, 
    MODEL = "Nicasio et al. (2009) - ICU", 
    MIC = 1, AUCPERMIC = 400, 
    LOADINGDOSE = "No", 
    CRCLCAP = "No cap", 
    REGIMENS = list(list(
        DOSE = 750, INTERVAL = 8, 
        TINF = 1, set = "REGIMEN"), 
        list(DOSE = 750, 
            INTERVAL = 12, 
            TINF = 1, 
            set = "REGIMEN"), 
        list(DOSE = 750, 
            INTERVAL = 24, 
            TINF = 1, 
            set = "REGIMEN"), 
        list(DOSE = 1000, 
            INTERVAL = 8, 
            TINF = 1, 
            set = "REGIMEN"), 
        list(DOSE = 1000, 
            INTERVAL = 12, 
            TINF = 1, 
            set = "REGIMEN"), 
        list(DOSE = 1000, 
            INTERVAL = 24, 
            TINF = 1, 
            set = "REGIMEN"), 
        list(DOSE = 1250, 
            INTERVAL = 8, 
            TINF = 1.25, 
            set = "REGIMEN"), 
        list(DOSE = 1250, 
            INTERVAL = 12, 
            TINF = 1.25, 
            set = "REGIMEN"), 
        list(DOSE = 1250, 
            INTERVAL = 24, 
            TINF = 1.25, 
            set = "REGIMEN"), 
        list(DOSE = 1500, 
            INTERVAL = 8, 
            TINF = 1.5, 
            set = "REGIMEN"), 
        list(DOSE = 1500, 
            INTERVAL = 12, 
            TINF = 1.5, 
            set = "REGIMEN"), 
        list(DOSE = 1500, 
            INTERVAL = 24, 
            TINF = 1.5, 
            set = "REGIMEN"), 
        list(DOSE = 1750, 
            INTERVAL = 8, 
            TINF = 1.75, 
            set = "REGIMEN"), 
        list(DOSE = 1750, 
            INTERVAL = 12, 
            TINF = 1.75, 
            set = "REGIMEN"), 
        list(DOSE = 1750, 
            INTERVAL = 24, 
            TINF = 1.75, 
            set = "REGIMEN")))
}

}
\references{
\itemize{
  \item Nicasio et al. (2009): Population Pharmacokinetics of High-Dose, Prolonged-Infusion Cefepime in Adult Critically Ill Patients with Ventilator-Associated Pneumonia. In. Antimicrobial Agents and Chemotherapy. https://pubmed.ncbi.nlm.nih.gov/19188394/
  \item Tam et al. (2003): Pharmacokinetics and Pharmacodynamics of Cefepime in Patients with Various Degrees of Renal Function. In. Antimicrobial Agents and Chemotherapy. https://pubmed.ncbi.nlm.nih.gov/12760858/
}
}
