#' Tobramycin » Bayesian » AUC/MIC
#' 
#' Tobramycin » Bayesian adaptive dosing » AUC to MIC ratio
#' 
#' \strong{Drug}:
#' Tobramycin
#' 
#' \strong{Method}:
#' Estimate the pharmacokinetic parameters of the patient from past concentrations with Bayesian inverse modeling, then use that information to predict the steady state concentrations for multiple dosing regimens and select the optimal one, with regard to the target pharmacodynamic index.
#' 
#' \strong{PK/PD target}:
#' 24 hour area under the concentration-time curve to minimum inhibitory concentration ratio.
#' 
#' @param PATID Patient Identifier. User-provided free text (such as patient id, name or alias) to identify related simulations. Must be provided as string.
#' @param AGE Age. Age of the patient in years. Must be provided as numeric (min. 18, max. 120 year).
#' @param HEIGHT Height. Height of the patient. Must be provided as numeric (min. 100, max. 250 cm).
#' @param WEIGHT Weight. Actual body weight of the patient. Must be provided as numeric (min. 20, max. 500 kg).
#' @param GENDER Sex. Patient's sex for clinical decision-making. Must be provided as string ('Male' or 'Female').
#' @param MODEL Model for population of interest. Pharmacokinetic model to be used for specific patient type during simulations. Must be provided as string ('Pai et al. (2011) - General ward').
#' @param MIC MIC. Minimum Inhibitory Concentration (MIC). Must be provided as numeric (min. 0.01, max. 1024 mg/L).
#' @param AUCPERMIC AUC to MIC ratio target. The PK/PD target can be provided as 24 hour area under the concentration-time curve to minimum inhibitory concentration ratio (AUC/MIC). Must be provided as numeric (min. 10, max. 2000 ).
#' @param HISTORY Historical Records.  Must be provided as list of 3-48 'HISTCREATININE', 'HISTDOSE' or 'HISTCONCENTRATION' values.
#' @param REGIMENS Dosing Regimens. List of dosing regimens to be used in simulating target attainment, from which the dosing regimen with the smallest absolute difference from the desired target will be automatically selected. Must be provided as list of 1-20 'REGIMEN' values. Use the \code{regimen} helper function to define the REGIMEN values.
#' 
#' @examples \dontrun{
#' simulate_tobramycin_bayesian_auc_mic_ratio(PATID = "Anonymous", 
#'     AGE = 65, HEIGHT = 175, 
#'     WEIGHT = 75, GENDER = "Male", 
#'     MODEL = "Pai et al. (2011) - General ward", 
#'     MIC = 1, AUCPERMIC = 50, 
#'     HISTORY = list(list(
#'         DATETIME = structure(1601870400, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'         DOSE = 200, TINF = 0.5, 
#'         set = "HISTDOSE"), 
#'         list(DATETIME = structure(1601881200, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             DOSE = 300, 
#'             TINF = 0.5, 
#'             set = "HISTDOSE"), 
#'         list(DATETIME = structure(1601899200, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             DOSE = 400, 
#'             TINF = 0.5, 
#'             set = "HISTDOSE"), 
#'         list(DATETIME = structure(1601942400, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             DOSE = 500, 
#'             TINF = 0.5, 
#'             set = "HISTDOSE"), 
#'         list(DATETIME = structure(1601866800, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             CREATININE = 0.9, 
#'             set = "HISTCREATININE"), 
#'         list(DATETIME = structure(1601906400, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             CREATININE = 0.7, 
#'             set = "HISTCREATININE"), 
#'         list(DATETIME = structure(1601888400, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             CONCENTRATION = 8, 
#'             set = "HISTCONCENTRATION"), 
#'         list(DATETIME = structure(1601890200, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             CONCENTRATION = 7, 
#'             set = "HISTCONCENTRATION"), 
#'         list(DATETIME = structure(1601906400, class = c("POSIXct", 
#'         "POSIXt"), tzone = ""), 
#'             CONCENTRATION = 10, 
#'             set = "HISTCONCENTRATION")), 
#'     REGIMENS = list(list(
#'         set = "REGIMEN", 
#'         DOSE = 100, INTERVAL = 8, 
#'         TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 100, 
#'             INTERVAL = 12, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 125, 
#'             INTERVAL = 8, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 125, 
#'             INTERVAL = 12, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 150, 
#'             INTERVAL = 8, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 150, 
#'             INTERVAL = 12, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 175, 
#'             INTERVAL = 8, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 175, 
#'             INTERVAL = 12, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 200, 
#'             INTERVAL = 8, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 200, 
#'             INTERVAL = 12, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 400, 
#'             INTERVAL = 24, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 400, 
#'             INTERVAL = 36, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 500, 
#'             INTERVAL = 24, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 500, 
#'             INTERVAL = 36, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 600, 
#'             INTERVAL = 24, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 600, 
#'             INTERVAL = 36, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 700, 
#'             INTERVAL = 24, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 700, 
#'             INTERVAL = 36, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 800, 
#'             INTERVAL = 24, 
#'             TINF = 0.5), 
#'         list(set = "REGIMEN", 
#'             DOSE = 800, 
#'             INTERVAL = 36, 
#'             TINF = 0.5)))
#' }
#' 
#' @references \itemize{
#'   \item Pai et al. (2011): Simplified Estimation of Aminoglycoside Pharmacokinetics in Underweight and Obese Adult Patients. In. Antimicrobial Agents and Chemotherapy. https://aac.asm.org/content/55/9/4006
#'   \item K. Soetaert, T. Petzoldt (2010): Inverse Modelling, Sensitivity and Monte Carlo Analysis in R Using Package FME. In. Journal of Statistical Software. https://www.jstatsoft.org/article/view/v033i03
#' }
#' @export 
#' @importFrom checkmate assert_number assert_string assert_choice
simulate_tobramycin_bayesian_auc_mic_ratio <- function(PATID, AGE, HEIGHT, WEIGHT, GENDER, MODEL, MIC, AUCPERMIC, HISTORY, REGIMENS) {
  ## check args
  assert_string(PATID)
  assert_number(AGE,
    lower = 18,
    upper = 120
  )
  assert_number(HEIGHT,
    lower = 100,
    upper = 250
  )
  assert_number(WEIGHT,
    lower = 20,
    upper = 500
  )
  assert_string(GENDER)
  assert_choice(GENDER, c("Male", "Female"))
  assert_string(MODEL)
  assert_choice(MODEL, c("Pai et al. (2011) - General ward"))
  assert_number(MIC,
    lower = 0.01,
    upper = 1024
  )
  assert_number(AUCPERMIC,
    lower = 10,
    upper = 2000
  )
  ## API call
  simulate("tobramycin-bayesian-auc-mic-ratio", PATID = PATID, AGE = AGE, HEIGHT = HEIGHT, WEIGHT = WEIGHT, GENDER = GENDER, MODEL = MODEL, MIC = MIC, AUCPERMIC = AUCPERMIC, HISTORY = HISTORY, REGIMENS = REGIMENS)
}
