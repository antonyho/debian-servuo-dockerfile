#!/bin/sh

echo "Copying custom configs to shard..."
cp -r /servuo-custom-configs/* /ServUO/Config/
echo "Copying custom configs to shard...Completed!"

cd /ServUO
echo "Starting Shard..."
mono ServUO.exe