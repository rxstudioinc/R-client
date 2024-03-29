% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_cefepime_mc_pta_fcmin_mic_ratio.R
\name{simulate_cefepime_mc_pta_fcmin_mic_ratio}
\alias{simulate_cefepime_mc_pta_fcmin_mic_ratio}
\title{Cefepime » PTA » fCmin/MIC}
\usage{
simulate_cefepime_mc_pta_fcmin_mic_ratio(
  PATID,
  AGE,
  HEIGHT,
  WEIGHT,
  GENDER,
  CREATININE,
  MODEL,
  CMINPERMIC,
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

\item{CMINPERMIC}{Minimum concentration to MIC ratio target. The PK/PD target can be provided as minimum concentration to minimum inhibitory concentration ratio (Cmin/MIC). Must be provided as numeric (min. 0.1, max. 50 ).}

\item{CRCLCAP}{Capping Creatinine Clearance. Whether to use capping for creatinine clearance. Must be provided as string ('No cap', '120 ml/min', '130 ml/min', '140 ml/min' or '150 ml/min').}

\item{REGIMENS}{Dosing Regimens. List of dosing regimens to be used in simulating target attainment, from which the dosing regimen with the smallest absolute difference from the desired target will be automatically selected. Must be provided as list of 1-8 'REGIMEN' values. Use the \code{regimen} helper function to define the REGIMEN values.}
}
\description{
Cefepime » Probability of Target Attainment » Free minimum concentration to MIC ratio
}
\details{
\strong{Drug}:
Cefepime

\strong{Method}:
Monte Carlo simulation on the probabilities that a specific value of a pharmacodynamic index is achieved in case of different minimum inhibitory concentrations (MIC).

\strong{PK/PD target}:
Free minimum concentration (mg/L) to minimum inhibitory concentration ratio (mg/L).
}
\examples{
\dontrun{
simulate_cefepime_mc_pta_fcmin_mic_ratio(PATID = "Anonymous", 
    AGE = 65, HEIGHT = 175, 
    WEIGHT = 75, GENDER = "Male", 
    CREATININE = 0.8760563, 
    MODEL = "Nicasio et al. (2009) - ICU", 
    CMINPERMIC = 4, CRCLCAP = "No cap", 
    REGIMENS = list(list(
        DOSE = 1000, 
        INTERVAL = 8, 
        TINF = 0.5, set = "REGIMEN")))
}

}
\references{
\itemize{
  \item Nicasio et al. (2009): Population Pharmacokinetics of High-Dose, Prolonged-Infusion Cefepime in Adult Critically Ill Patients with Ventilator-Associated Pneumonia. In. Antimicrobial Agents and Chemotherapy. https://pubmed.ncbi.nlm.nih.gov/19188394/
  \item Tam et al. (2003): Pharmacokinetics and Pharmacodynamics of Cefepime in Patients with Various Degrees of Renal Function. In. Antimicrobial Agents and Chemotherapy. https://pubmed.ncbi.nlm.nih.gov/12760858/
}
}
