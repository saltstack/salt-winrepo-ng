#!/usr/bin/env python3
import sys
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONFIG_FILE = ROOT / ".pre-commit-config.yaml"
PRESETS = ROOT / ".cicd/presets"

def main(argv: list[str]) -> int:
    if not CONFIG_FILE.exists():
        print(".pre-commit-config.yaml not found in repo root")
        return 1

    config_text = CONFIG_FILE.read_text()

    missing = []
    for file_arg in argv:
        path = pathlib.Path(file_arg)

        # only care about JSONs in repo root
        if path.suffix == ".json" and path.parent.resolve() == PRESETS:
            print(f"Checking {path.name}...", flush=True)
            if path.name not in config_text:
                missing.append(path.name)

    if missing:
        print("\nThese JSON files are missing from .pre-commit-config.yaml:")
        for m in missing:
            print(f"   - {m}")
        return 1

    print("\nAll JSON files passed the config check")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
