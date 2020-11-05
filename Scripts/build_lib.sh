xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXXXXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

cat > "$xcconfig" <<- EOF
DEBUG_INFORMATION_FORMAT = dwarf
ENABLE_BITCODE = NO
SWIFT_VERSION = 5.0
FRAMEWORK_SEARCH_PATHS = \$(inherited) $(pwd)/Carthage/Build/iOS/**
EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8
EXCLUDED_ARCHS=\$(inherited) \$(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_\$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_\$(NATIVE_ARCH_64_BIT))
EOF


echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"

# Update Cartfile
carthage update --platform ios --cache-builds --no-use-binaries