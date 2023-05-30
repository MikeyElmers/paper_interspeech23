[![orcid](https://img.shields.io/badge/ORCID-0000--0002--3929--788X-green?style=plastic&logo=orcid&url=https://orcid.org/0000-0002-3929-788X)](https://orcid.org/0000-0002-3929-788X)

# Synthesis after a couple PINTs
This repository contains the data and code for "Synthesis after a couple PINTs: Investigating the role of pause-internal phonetic particles in speech synthesis and perception" by Mikey Elmers, Johannah O'Mahony, and Éva Székely for the 24th INTERSPEECH Conference (Interspeech '23), Dublin, August 20-24. This project developed TTS systems that included pause-internal phonetic particles and evaluated participant's evaluated speaker certainty.

The following PINTs are investigated: 

* silence (sil)
* inhalation noise (in)
* exhalation noise (ex)
* filler particles (uh/um)
* tongue click (cl)

## Table Of Contents

- [Instructions](#instructions)
- [Directory information](#directory-information)
    * [data](#data)
    * [docs](#docs)
    * [output](#output)
    * [scripts](#scripts)
- [Issues/comments/suggestions](#issuescommentssuggestions)
- [License](#license)
- [References](#references)

## Instructions
1. Clone repository.
   ```bash
   git clone https://github.com/MikeyElmers/paper_interspeech23.git
   cd paper_interspeech23/
   ```
2. Rmarkdown documents and the sessionInfo are located in `output/`.

## Directory Information
### `data`
- Raw data
- Final data

### `docs`
- `elmers_interspeech23_paper.pdf`: Interspeech '23 paper submission (will be added when available)

### `output`
- `02_analysis.html`: Output of analysis.Rmd file
- `sessionInfo.txt`: R session info
- `plot_heatmag.png`: Heatmap for certainty score and condition

### `scripts`
- `00_renvRestore.R`: Restores project dependencies
- `01_clean.R`: Cleans and exports final data
- `02_analysis.Rmd`: Descriptive and inferential data analysis

## Issues/Comments/Suggestions
Please use the [issue tracker](https://github.com/MikeyElmers/paper_interspeech23/issues). 

## License
This code is licensed under the terms of the MIT license. See [LICENSE.md](https://github.com/MikeyElmers/paper_interspeech23/blob/master/LICENSE.md) 

## References
Langdon Hammer, Modern Poetry (Yale University: Open Yale Couses), http://oyc.yale.edu (Accessed June 27, 2022). License: Creative Commons BY-NC-SA