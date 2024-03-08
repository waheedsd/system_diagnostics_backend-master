FROM node:10

RUN groupadd -g 2759 allgovision

RUN useradd -m -u 2759 -g 2759 allgovision

WORKDIR /home/allgovision

# Set executable permissions
RUN chmod +x /home/allgovision/

# Change ownership of copied files
RUN chown -R allgovision:allgovision /home/allgovision

# Create necessary directory and set ownership
RUN mkdir -p /home/allgovision/system_diagnostic/configuration
RUN chown -R allgovision:allgovision /home/allgovision

# Copy the executable
COPY systemdiagnosticbackend /home/allgovision/

EXPOSE 8080

#Switch user
USER allgovision
CMD ["./systemdiagnosticbackend"]
