# Use the Debian-based official PostgreSQL image (standard is based on Debian)
FROM postgres:17

# Set environment variables
ENV LANG="et_EE.UTF-8"
ENV LANGUAGE="et_EE:en"
ENV LC_ALL="et_EE.UTF-8"

# 1. Update and install the 'locales' package (which includes locale-gen).
# 2. Add the desired locale definition to locale.gen.
# 3. Run locale-gen to compile the locale.
RUN apt-get update && apt-get install -y locales \
    && echo "et_EE.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen et_EE.UTF-8 \
    && rm -rf /var/lib/apt/lists/*
