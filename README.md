## Firebase information 
Email: pclhabittracker@gmail.com 

Password: Habit123! 

To connect to backend, you need to install Cocoapods. Follow the tutorial here: https://guides.cocoapods.org/using/getting-started.html \
After installing, open the project in your terminal and run 'pod install'. Firebase should be up and running after this step!

This project uses Firebase's 'Authentication' and 'Firestore Database'. Authentication is currenly only associated with an email and password put into LoginView. The Firestore database stores a collection ('users') of users, which stores documents by user id. Each user is initialized with fields 'email' and 'uid', but you can initialize more as you see fit. For example, you can add a 'habit' list as a user's document field to store each of the habits.
