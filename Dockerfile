FROM usgswma/wma-spring-boot-base:8-jre-slim-0.0.4

# Pull Artifact
ENV repo_name=aqcu-maven-centralized
ENV artifact_id=aqcu-tss-report
ENV artifact_version=0.0.1-SNAPSHOT
RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.aqcu ${artifact_id} ${artifact_version} app.jar

#Add Launch Script
ADD launch-app.sh launch-app.sh
RUN ["chmod", "+x", "launch-app.sh"]

#Default ENV Values
ENV serverPort=7501
ENV javaToRServerList=https://reporting-services.nwis.usgs.gov:7500
ENV aqcuReportsWebserviceUrl=https://reporting.nwis.usgs.gov/aqcu/timeseries-ws/
ENV aquariusServiceEndpoint=http://tsqa.nwis.usgs.gov
ENV aquariusServiceUser=apinwisra
ENV AQUARIUS_SERVICE_PASSWORD_PATH=/aquariusPassword.txt
ENV HEALTHY_RESPONSE_CONTAINS='{"status":{"code":"UP","description":""}'
