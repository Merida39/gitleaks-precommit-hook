
Структура репозиторію


├── pre-commit                 
├── scripts/                   
│   └── install_gitleaks.sh
└── gitleaks.exe # Для використання на Windows


Інструкція з підключення

Встановити pre-commit hook

cp pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit


Крок 2: Увімкнути pre-commit hook

git config gitleaks.precommit.enabled true



Крок 3: Встановити Gitleaks

Для Windows:
Потрібно завантажжити файл gitleaks.exe з офіційного релізу
Покладіть файл gitleaks.exe у корінь вашого проєкту


Для Linux/macOS:
Gitleaks встановиться автоматично через скрипт scripts/install_gitleaks.sh



Крок 4: Перевірка
Додайте тестовий токен у файл, наприклад:

go
var token = "123456789:ABCDEF..."

Виконайте:

git add .

git commit -m "Test gitleaks hook"

Якщо токен знайдено — коміт буде заблоковано:




Gitleaks виявив секрети в закомічених файлах! Коміт заблоковано.
Якщо нічого не знайдено — коміт пройде успішно:

 Ніяких секретів не знайдено. Коміт дозволено.




Увімкнення/Вимкнення hook

Вимкнути:

git config gitleaks.precommit.enabled false
Увімкнути:

git config gitleaks.precommit.enabled true


 Важливо:
Gitleaks версії 8+ більше не підтримує перевірку тільки staged файлів.

Використовується опція --source . --no-git, яка сканує всі файли в робочій директорії.