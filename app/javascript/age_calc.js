window.addEventListener('load', function(){
  petBirthDay = document.getElementById('pet-birthday').textContent
  birthYear = petBirthDay.slice(0,4)
  birthMonth = petBirthDay.slice(5,7)
  birthDate = petBirthDay.slice(8,10)

  // const birthYearInput = document.getElementById("pet_birthday_1i").value
  // const birthMonthInput = document.getElementById("pet_birthday_2i").value
  // const birthDateInput = document.getElementById("pet_birthday_3i").value

  const today = new Date()
  const petBirth = new Date( 1970, 0, birthDate )
  petBirth.setTime( today.getTime() - petBirth.getTime() )
  let petYear = petBirth.getUTCFullYear() - birthYear
  let petMonth = petBirth.getUTCMonth() - (birthMonth - 1)
  if(petMonth < 0){
    petYear --
    petMonth += 12
  }
  const petDate = petBirth.getUTCDate()
  const petAgeZone = document.getElementById('pet-age')
  petAgeZone.innerHTML = ""+petYear+"歳 "+petMonth+"ヶ月 "+petDate+"日目"
})
