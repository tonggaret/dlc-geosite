# dlc-geosite

[![Build](https://github.com/tonggaret/dlc-geosite/actions/workflows/build.yml/badge.svg)](https://github.com/tonggaret/dlc-geosite/actions/workflows/build.yml)

## Source domain filter

- **AdGuardSDNSFilter**
   > `https://cdn.jsdelivr.net/gh/blackmatrix7/ios_rule_script@master/rule/Clash/AdGuardSDNSFilter/AdGuardSDNSFilter_Domain.yaml`
- **AdAway**
   > `https://cdn.jsdelivr.net/gh/deathbybandaid/piholeparser@master/Subscribable-Lists/ParsedBlacklists/AdAway-Default-Blocklist.txt`
- **ABPindo**
   > `https://cdn.jsdelivr.net/gh/ABPindo/indonesianadblockrules@master/subscriptions/domain.txt`
- **1Hosts-Lite**
   > `https://cdn.jsdelivr.net/gh/badmojr/1Hosts@master/Lite/domains.txt`
- **UrlHaus-malware**
   > `https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-domains-online.txt`

## Usage

### Clash / MiHomo

<details>
  <summary>GeoSite.dat<p></summary>

```yaml
geox-url:
  geosite: https://cdn.jsdelivr.net/gh/tonggaret/dlc-geosite@subscribe/GeoSite.dat/GeoSite.dat

rules:
  - GEOSITE,category-ads-all,REJECT
```

</details>

<details>
  <summary>Rule provider<p></summary>

```yaml
rule-providers:
  category-ads-all:
    type: http
    url: https://cdn.jsdelivr.net/gh/tonggaret/dlc-geosite@subscribe/category-ads-all/category-ads-all
    behavior: domain
    path: ./providers/rules/category-ads-all
    interval: 86400
    format: text

rules:
  - RULE-SET,category-ads-all,REJECT
```

</details>

### Sing-box

<details>
  <summary>GeoSite.db [ ⚠ Deprecated in sing-box 1.8.0 ]<p></summary>

```json
  "route": {
    "geosite": {
      "path": "./GeoSite.db",
      "download_url": "https://cdn.jsdelivr.net/gh/tonggaret/dlc-geosite@subscribe/GeoSite.db/GeoSite.db",
      "download_detour": "direct"
    },
    "rules": [
      {
        "geosite": "category-ads-all",
        "outbound": "block"
      }
    ]
  }
```

</details>

<details>
  <summary>Rule Set [ Since sing-box 1.8.0 ]<p></summary>

```json
  "route": {
    "rule_set": [
      {
        "type": "remote",
        "tag": "category-ads-all",
        "format": "binary",
        "url": "https://cdn.jsdelivr.net/gh/tonggaret/dlc-geosite@subscribe/category-ads-all.srs/category-ads-all.srs",
        "download_detour": "direct",
        "update_interval": "12h0m0s"
      }
    ],
    "rules": [
      {
        "rule_set": "category-ads-all",
        "outbound": "block"
      }
    ]
  }
```

</details>
