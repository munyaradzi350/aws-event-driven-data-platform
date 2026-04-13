from pyspark.context import SparkContext # type: ignore
from awsglue.context import GlueContext # type: ignore
from awsglue.job import Job # type: ignore

sc = SparkContext()
glue_context = GlueContext(sc)
job = Job(glue_context)

print("Glue job started successfully!!")

job.commit()