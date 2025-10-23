# LinkedIn AIHawk - Job Application Bot 🚀

An automated LinkedIn job search and application bot powered by AI. Part of the GemApps Suite.

## Quick Reference

**Original Project**: [LinkedIn_AIHawk](https://github.com/feder-cr/LinkedIn_AIHawk_automatic_job_application)  
**See `README.md`** for complete original documentation.

## GemApps Integration

This app has been added to the GemApps suite for easy management and documentation.

### Status

⚠️ **External Project** - This is a third-party application included in GemApps for convenience.

### Prerequisites

- Python 3.8+
- Google Chrome (latest version)
- LinkedIn account
- OpenAI API key (for AI features)

### Quick Start

```bash
cd /home/david/gemapps/linkedIn_auto_jobs_applier_with_AI

# Install dependencies
pip install -r requirements.txt

# Configure (see original README.md)
# 1. Create secrets.yaml with LinkedIn credentials
# 2. Create config.yaml with job search parameters
# 3. Configure data_folder/ with your information

# Run
python main.py
```

### Recommended: Convert to Poetry

For consistency with GemApps standards [[memory:8054992]], convert to Poetry:

```bash
# Create pyproject.toml from requirements.txt
poetry init --no-interaction
poetry add $(cat requirements.txt | grep -v '^#' | grep -v '^$')
poetry install

# Then run with:
poetry run python main.py
```

## Features Summary

1. **Automated Job Search** - Continuous scanning for new LinkedIn job postings
2. **One-Click Applications** - Auto-applies using LinkedIn Easy Apply
3. **AI-Powered Responses** - Generates personalized answers to application questions
4. **Resume Tailoring** - Dynamically generates job-specific resumes
5. **Smart Filtering** - Company blacklists and title filters
6. **Application Tracking** - Detailed logs of all applications

## Configuration Files

- `secrets.yaml` - LinkedIn credentials and API keys (⚠️ **DO NOT COMMIT**)
- `config.yaml` - Job search parameters and preferences
- `data_folder/` - Your personal information (resume, cover letter, etc.)

## Important Notes

### ⚠️ Security Warnings

1. **Never commit secrets.yaml** - Contains sensitive credentials
2. **Use responsibly** - Respect LinkedIn's Terms of Service
3. **Rate limiting** - Don't overwhelm LinkedIn with requests
4. **Account safety** - Monitor for unusual activity

### Legal & Ethical Considerations

- This tool automates LinkedIn interactions
- Use at your own risk
- May violate LinkedIn's Terms of Service
- Could result in account suspension
- Only use for legitimate job searching
- Review applications before submission

## GemApps Structure Note

This app maintains its original structure and documentation. See the original `README.md` for:

- Detailed installation instructions
- Configuration guide
- Usage examples
- Troubleshooting
- Full feature documentation

## TODO for GemApps Integration

- [ ] Convert to Poetry for dependency management
- [ ] Add to GemApps Dashboard (if desired)
- [ ] Create comprehensive docs/008-linkedin-aihawk.md
- [ ] Add .env support instead of secrets.yaml
- [ ] Create start script for easy launching
- [ ] Add logging integration with GemApps suite

## Documentation

- **Original README**: [README.md](README.md) - Complete documentation
- **GemApps Docs**: To be created in `/docs/008-linkedin-aihawk.md`
- **Telegram Community**: https://t.me/AIhawkCommunity

## Part of GemApps Suite

This app is part of the [GemApps Suite](../README.md).

---

**Automate your LinkedIn job search** 🚀

**Status**: ⚠️ External project - Use with caution and responsibility
