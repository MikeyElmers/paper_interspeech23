############
### Info ###
############
#
# Project: Synthesis after a couple PINTs: Investigating the role of pause-internal phonetic particles in speech synthesis and perception
#
# Conference: 24th INTERSPEECH Conference (Interspeech '23), Dublin, August 20-24
#
# Contributors: Mikey Elmers
#
# Part 01: Load and clean data
#
# Date: February 26, 2023
#
#-------------------------------------------------------
# load packages
library(dplyr)

# load data
df <- read.csv(file = "data/raw/trials.csv", row.names = NULL)

# check for age and hearing impairment
# mean age = 40.7; age range is 20-70
# 0 cases of hearing impairment
df_questionnaire <- df %>% 
  filter(Task_Name == "questionnaire")

df_questionnaire %>% summarise(mean_age=mean(age), 
                              min_age=min(age), 
                              max_age=max(age))

table(df_questionnaire$imphear)

# remove extraneous rows
df_temp <- df %>% 
  filter(Task_Name == "listening")

# remove extraneous columns
df_temp <- df_temp %>% 
  select(-Block_Name, -Block_Nr, -Task_Name, -Task_Nr, -Trial_Id, -Trial_Nr, 
         -age, -audiofile, -Condition_Id, -imphear, -progress, -prolific, 
         -set_frame_nr, -TrialNr.TotalNrTrials, -TrialNr.TotalNrTrials_copy_1b9f)

# rename columns
names(df_temp)[names(df_temp)=="factor1_tg1_task2"] <- "stimuli"
names(df_temp)[names(df_temp)=="Rec_Session_Id"] <- "subj_id"

# create a new column that indicates TTS stimuli condition
# fluent = fluent condition
# click = tongue click condition
# um = um condition
# sil = silence condition
df_temp <- df_temp %>% 
  mutate(condition = case_when(
    startsWith(stimuli, "c_") ~ "click",
    startsWith(stimuli, "f_") ~ "fluent",
    startsWith(stimuli, "u_") ~ "um",
    startsWith(stimuli, "s_") ~ "sil",
    TRUE ~ "other"
  ))

# Clean data for comparing natural and TTS models
df_tts <- read.csv(file = "data/raw/tts.csv", row.names = NULL)

# since we encountered the "duplicate 'row.names' are not allowed" issue
# removes the row.names column name
colnames(df_tts) <- colnames(df_tts)[2:ncol(df_tts)]
df_tts <- df_tts[1:(ncol(df_tts)-1)]

# create a new column that indicate whether audio is natural, noPINTs, or PINTs
df_tts <- df_tts %>% 
  mutate(condition = case_when(
    startsWith(file, "NAT_") ~ "natural",
    startsWith(file, "noPINTs_") ~ "noPINTs",
    startsWith(file, "PINTs_") ~ "PINTs",
    TRUE ~ "other"
  ))

# remove rows where label == np (speech)
df_tts <- df_tts %>% 
  filter(segment != "np")

table(df_tts$segment)

# remove _v1 or _v2 from some of the audio files
df_tts <- df_tts %>% 
  mutate(file = gsub("_v[12]$", "", file))

# create a column for each audio file
df_tts <- df_tts %>% 
  mutate(proto_file = case_when(
    endsWith(file, "01_234") ~ "engl310_01_234",
    endsWith(file, "01_236") ~ "engl310_01_236",
    endsWith(file, "01_248") ~ "engl310_01_248",
    endsWith(file, "13_87") ~ "engl310_13_87",
    endsWith(file, "24_10") ~ "engl310_24_10",
    TRUE ~ "other"
  ))

# write updated dataframe to "final" sub directory within the "data" directory
write.csv(df_temp, "data/final/data_cleaned.csv", row.names = FALSE)
write.csv(df_tts, "data/final/data_tts_cleaned.csv", row.names = FALSE)