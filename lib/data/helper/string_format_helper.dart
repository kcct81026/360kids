// Function to format the age range
String getFormattedAgeRange(List<String> ageRange) {
  if (ageRange.length > 1) {
    // Check if both start and end age ranges contain '-'
    if (ageRange.first.contains('-') && ageRange.last.contains('-')) {
      final firstParts = ageRange.first.split(' - ');
      final lastParts = ageRange.last.split(' - ');

      // Compare the start of the first age range with the end of the last age range
      return "${firstParts.first} - ${lastParts.last}";
    }
    else if(ageRange.first.contains('-')){
      final firstParts = ageRange.first.split(' - ');
      return "${firstParts.first} - ${ageRange.last}";

    }
    else if(ageRange.last.contains('-')){
      final lastParts = ageRange.last.split(' - ');
      return "${ageRange.first} - ${lastParts.last}";
    }
    // Default behavior for other cases
    return "${ageRange.first} - ${ageRange.last}";
  } else if (ageRange.length == 1) {
    return ageRange.first;
  } else {
    return "Unknown";  // or any default value you want to return for an empty age range
  }
}