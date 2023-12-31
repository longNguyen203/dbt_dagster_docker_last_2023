from dagster import AssetExecutionContext, asset
from dagster_dbt import DbtCliResource, dbt_assets

from .constants import dbt_manifest_path


@dbt_assets(manifest=dbt_manifest_path)
def warehouse_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()