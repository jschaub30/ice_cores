# ice_cores
Charting temperature changes from ice core data.

The initial dataset charts the temperature derived from the Greenland Ice Sheet
Project Two ("GISP2"). See [this description][description].

# Try it out
### Pre-requisites
- make
- docker


```bash
git clone https://github.com/jschaub30/ice_cores.git
cd ice_cores
make term
```
Now open [http://localhost:5000](http://localhost:5000) in your browser.

### Sources
- [raw data][raw]

[description]: https://www1.ncdc.noaa.gov/pub/data/paleo/icecore/greenland/summit/gisp2/gisp2-info.txt
[raw]: https://www1.ncdc.noaa.gov/pub/data/paleo/icecore/greenland/summit/gisp2/isotopes/gisp2_temp_accum_alley2000.txt
