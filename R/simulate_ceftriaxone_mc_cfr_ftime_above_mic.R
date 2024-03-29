#' Ceftriaxone » CFR » \% fT > MIC
#' 
#' Ceftriaxone » Cumulative Fraction of Response » Percent time of free concentration above MIC
#' 
#' \strong{Drug}:
#' Ceftriaxone
#' 
#' \strong{Method}:
#' Monte Carlo simulation on the proportion of the population achieving a certain pharmacodynamic index value, given the minimum inhibitory concentration (MIC) distribution of the target microorganism(s).
#' 
#' \strong{PK/PD target}:
#' The percent of time that the free concentration is above the minimum inhibitory concentration.
#' 
#' @param PATID Patient Identifier. User-provided free text (such as patient id, name or alias) to identify related simulations. Must be provided as string.
#' @param AGE Age. Age of the patient in years. Must be provided as numeric (min. 18, max. 120 year).
#' @param HEIGHT Height. Height of the patient. Must be provided as numeric (min. 100, max. 250 cm).
#' @param WEIGHT Weight. Actual body weight of the patient. Must be provided as numeric (min. 20, max. 500 kg).
#' @param GENDER Sex. Patient's sex for clinical decision-making. Must be provided as string ('Male' or 'Female').
#' @param CREATININE Creatinine. Serum creatinine. Must be provided as numeric (min. 0.01, max. 15 mg/dL).
#' @param MODEL Model for population of interest. Pharmacokinetic model to be used for specific patient type during simulations. Must be provided as string ('Garot et al. (2011) - ICU, septic patients').
#' @param PCTABOVEMIC Percent of time target that the drug concentration is above MIC. The PK/PD target can be provided as the percent of time that the drug concentration is above the minimum inhibitory concentration (\% T > MIC). Must be provided as numeric (min. 5, max. 100 \%).
#' @param CRCLCAP Capping Creatinine Clearance. Whether to use capping for creatinine clearance. Must be provided as string ('No cap', '120 ml/min', '130 ml/min', '140 ml/min' or '150 ml/min').
#' @param REGIMENS Dosing Regimens. List of dosing regimens to be used in simulating target attainment, from which the dosing regimen with the smallest absolute difference from the desired target will be automatically selected. Must be provided as list of 1-8 'REGIMEN' values. Use the \code{regimen} helper function to define the REGIMEN values.
#' @param MICDISTR MIC distribution. Non-cumulative MIC distribution of organism for the given antibiotic at the specified MICs provided as percentages with a sum of 100\%. MIC distribution of ceftriaxone and comparator antimicrobial agents when tested against Escherichia isolates in the SENTRY program collected during 2013-2019 (mg/L). Dataset provided by JMI Laboratories and the SENTRY Antimicrobial Surveillance Program, available at <a href="http://sentry-mvp.jmilabs.com" target="_new">sentry-mvp.jmilabs.com</a>. Must be provided as set.
#' 
#' @examples \dontrun{
#' simulate_ceftriaxone_mc_cfr_ftime_above_mic(PATID = "Anonymous", 
#'     AGE = 85, HEIGHT = 170, 
#'     WEIGHT = 120, GENDER = "Male", 
#'     CREATININE = 1, MODEL = "Garot et al. (2011) - ICU, septic patients", 
#'     PCTABOVEMIC = 90, 
#'     CRCLCAP = "No cap", 
#'     REGIMENS = list(list(
#'         DOSE = 500, INTERVAL = 12, 
#'         TINF = 0.5, set = "REGIMEN"), 
#'         list(DOSE = 500, 
#'             INTERVAL = 24, 
#'             TINF = 0.5, 
#'             set = "REGIMEN"), 
#'         list(DOSE = 1000, 
#'             INTERVAL = 12, 
#'             TINF = 0.5, 
#'             set = "REGIMEN"), 
#'         list(DOSE = 1000, 
#'             INTERVAL = 24, 
#'             TINF = 0.5, 
#'             set = "REGIMEN"), 
#'         list(DOSE = 1500, 
#'             INTERVAL = 12, 
#'             TINF = 0.5, 
#'             set = "REGIMEN"), 
#'         list(DOSE = 1500, 
#'             INTERVAL = 24, 
#'             TINF = 0.5, 
#'             set = "REGIMEN"), 
#'         list(DOSE = 2000, 
#'             INTERVAL = 12, 
#'             TINF = 0.5, 
#'             set = "REGIMEN"), 
#'         list(DOSE = 2000, 
#'             INTERVAL = 24, 
#'             TINF = 0.5, 
#'             set = "REGIMEN")), 
#'     MICDISTR = list("MICDISTR-0.015625" = list(
#'         0), "MICDISTR-0.03125" = list(
#'         0), "MICDISTR-0.0625" = list(
#'         66.3), "MICDISTR-0.125" = list(
#'         11.5), "MICDISTR-0.25" = list(
#'         2.2), "MICDISTR-0.5" = list(
#'         0.5), "MICDISTR-1" = list(
#'         0.4), "MICDISTR-2" = list(
#'         0.2), "MICDISTR-4" = list(
#'         0.2), "MICDISTR-8" = list(
#'         0.4), "MICDISTR-16" = list(
#'         18.2)))
#' }
#' 
#' @references \itemize{
#'   \item Garot, Denis et al. (2011): Population pharmacokinetics of ceftriaxone in critically ill septic patients: a reappraisal. In. British Journal of Clinical Pharmacology. https://bpspubs.onlinelibrary.wiley.com/doi/full/10.1111/j.1365-2125.2011.04005.x
#' }
#' @export 
#' @importFrom checkmate assert_number assert_string assert_choice
simulate_ceftriaxone_mc_cfr_ftime_above_mic <- function(PATID, AGE, HEIGHT, WEIGHT, GENDER, CREATININE, MODEL, PCTABOVEMIC, CRCLCAP, REGIMENS, MICDISTR) {
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
  assert_number(CREATININE,
    lower = 0.01,
    upper = 15
  )
  assert_string(MODEL)
  assert_choice(MODEL, c("Garot et al. (2011) - ICU, septic patients"))
  assert_number(PCTABOVEMIC,
    lower = 5,
    upper = 100
  )
  assert_string(CRCLCAP)
  assert_choice(CRCLCAP, c("No cap", "120 ml/min", "130 ml/min", "140 ml/min", "150 ml/min"))
  ## API call
  simulate("ceftriaxone-mc-cfr-ftime-above-mic", PATID = PATID, AGE = AGE, HEIGHT = HEIGHT, WEIGHT = WEIGHT, GENDER = GENDER, CREATININE = CREATININE, MODEL = MODEL, PCTABOVEMIC = PCTABOVEMIC, CRCLCAP = CRCLCAP, REGIMENS = REGIMENS, MICDISTR = MICDISTR)
}
