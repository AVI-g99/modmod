<!DOCTYPE html>
<html lang="he" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>סימולטור מודולו - דפוסים מתמטיים</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4a5568;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .simulators {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .simulator {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border: 2px solid #e2e8f0;
            transition: transform 0.3s ease;
        }

        .simulator:hover {
            transform: translateY(-5px);
        }

        .simulator h2 {
            color: #2d3748;
            margin-bottom: 20px;
            text-align: center;
            font-size: 1.5em;
        }

        .controls {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            align-items: center;
            flex-wrap: wrap;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        label {
            font-weight: bold;
            color: #4a5568;
            font-size: 0.9em;
        }

        input[type="number"] {
            padding: 10px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 16px;
            width: 80px;
            text-align: center;
            transition: border-color 0.3s ease;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
        }

        button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: transform 0.2s ease;
        }

        button:hover {
            transform: scale(1.05);
        }

        .canvas-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        canvas {
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            background: white;
        }

        .result {
            text-align: center;
            margin-top: 15px;
            padding: 15px;
            background: #f7fafc;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }

        .result h3 {
            color: #2d3748;
            margin-bottom: 10px;
        }

        .result p {
            color: #4a5568;
            font-size: 1.1em;
        }

        .primes-display {
            margin-top: 15px;
            padding: 15px;
            background: #e6fffa;
            border-radius: 8px;
            border-left: 4px solid #38b2ac;
        }

        .primes-display h4 {
            color: #285e61;
            margin-bottom: 10px;
        }

        .primes-list {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
        }

        .prime-number {
            background: #38b2ac;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }

        .legend {
            text-align: center;
            margin-top: 10px;
            font-size: 0.9em;
            color: #4a5568;
        }

        .step-list {
            margin-top: 10px;
            padding: 10px;
            background: #f7fafc;
            border-radius: 8px;
            text-align: center;
            font-size: 0.9em;
            color: #4a5568;
        }

        .step-item {
            margin: 5px 0;
        }

        @media (max-width: 768px) {
            .simulators {
                grid-template-columns: 1fr;
            }
            
            .controls {
                flex-direction: column;
                align-items: stretch;
            }
            
            input[type="number"] {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔢 סימולטור מודולו - דפוסים מתמטיים</h1>
        
        <div class="simulators">
            <!-- סימולציה ראשונה - מודולו רגיל -->
            <div class="simulator">
                <h2>מודולו רגיל (a mod b)</h2>
                <div class="controls">
                    <div class="input-group">
                        <label for="numA">מספר a:</label>
                        <input type="number" id="numA" value="5" min="1">
                    </div>
                    <div class="input-group">
                        <label for="numB">מודולו b:</label>
                        <input type="number" id="numB" value="20" min="2">
                    </div>
                    <button onclick="updateRegularModulo()">עדכן</button>
                </div>
                
                <div class="canvas-container">
                    <canvas id="regularCanvas" width="300" height="300"></canvas>
                </div>
                
                <div class="result" id="regularResult">
                    <h3>תוצאה:</h3>
                    <p id="regularResultText">(5 mod 20) = 5</p>
                </div>
                
                <div class="primes-display" id="primesDisplay">
                    <h4>מספרים ראשוניים עד 20:</h4>
                    <div class="primes-list" id="primesList"></div>
                </div>
            </div>

            <!-- סימולציה שנייה - מודולו עם דלתא -->
            <div class="simulator">
                <h2>מודולו עם פונקציית דלתא</h2>
                <div class="controls">
                    <div class="input-group">
                        <label for="deltaA">היסט התחלתי a (לעיגול):</label>
                        <input type="number" id="deltaA" value="0" min="0">
                    </div>
                    <div class="input-group">
                        <label for="deltaB">מודולו b:</label>
                        <input type="number" id="deltaB" value="4" min="1">
                    </div>
                    <div class="input-group">
                        <label for="deltaStep">צעד (מרווח דגימה):</label>
                        <input type="number" id="deltaStep" value="1" min="1">
                    </div>
                    <button onclick="updateDeltaModulo()">עדכן</button>
                </div>
                
                <div class="canvas-container">
                    <canvas id="deltaCanvas" width="300" height="300"></canvas>
                </div>
                <div class="legend">חצים מסמנים את ההתקדמות של k = 0, 1, ..., b-1</div>
                <div class="step-list" id="deltaStepList"></div>
                
                <div class="canvas-container">
                    <canvas id="deltaLinearCanvas" width="400" height="200"></canvas>
                </div>
                
                <div class="result" id="deltaResult">
                    <h3>דפוס דלתא:</h3>
                    <p id="deltaResultText">גרף לינארי: x[n] = δ[n mod 4] עבור n = 0, 1, 2, ...; עיגול: δ[(0 + k·1) mod 4] עבור k = 0, 1, ..., 3</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        // פונקציה לבדיקת מספר ראשוני
        function isPrime(n) {
            if (n < 2) return false;
            if (n === 2) return true;
            if (n % 2 === 0) return false;
            for (let i = 3; i <= Math.sqrt(n); i += 2) {
                if (n % i === 0) return false;
            }
            return true;
        }

        // פונקציה לקבלת מספרים ראשוניים עד n
        function getPrimesUpTo(n) {
            const primes = [];
            for (let i = 2; i <= n; i++) {
                if (isPrime(i)) {
                    primes.push(i);
                }
            }
            return primes;
        }

        // פונקציה לציור עיגול עם מספרים
        function drawCircle(canvas, numbers, highlightedNumbers = [], primes = [], stepPoints = []) {
            const ctx = canvas.getContext('2d');
            if (!ctx) {
                console.error('Failed to get 2D context for canvas:', canvas.id);
                return;
            }
            
            const centerX = canvas.width / 2;
            const centerY = canvas.height / 2;
            const radius = 120;
            
            // נקה את הקנבס
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            
            // צייר עיגול רקע
            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
            ctx.strokeStyle = '#e2e8f0';
            ctx.lineWidth = 2;
            ctx.stroke();
            
            // חשב זווית בין המספרים
            const angleStep = (2 * Math.PI) / numbers.length;
            
            // צייר נקודות ומספרים
            numbers.forEach((num, index) => {
                const angle = index * angleStep - Math.PI / 2;
                const x = centerX + radius * Math.cos(angle);
                const y = centerY + radius * Math.sin(angle);
                
                // צייר נקודה
                ctx.beginPath();
                ctx.arc(x, y, 8, 0, 2 * Math.PI);
                
                // צבע לפי סוג המספר
                if (highlightedNumbers.includes(num)) {
                    ctx.fillStyle = '#667eea';
                } else if (primes.includes(num)) {
                    ctx.fillStyle = '#38b2ac';
                } else {
                    ctx.fillStyle = '#cbd5e0';
                }
                
                ctx.fill();
                ctx.strokeStyle = '#2d3748';
                ctx.lineWidth = 2;
                ctx.stroke();
                
                // צייר את המספר
                ctx.fillStyle = '#2d3748';
                ctx.font = 'bold 14px Arial';
                ctx.textAlign = 'center';
                ctx.textBaseline = 'middle';
                ctx.fillText(num.toString(), x, y);
            });

            // צייר חצים עבור צעדים
            if (stepPoints.length > 0) {
                ctx.strokeStyle = '#667eea';
                ctx.fillStyle = '#667eea';
                ctx.lineWidth = 2;
                ctx.setLineDash([5, 5]);
                
                stepPoints.forEach(({k, index}, i) => {
                    const angle = index * angleStep - Math.PI / 2;
                    const x = centerX + radius * Math.cos(angle);
                    const y = centerY + radius * Math.sin(angle);
                    
                    // צייר חץ לשלב הבא
                    if (i < stepPoints.length - 1) {
                        const nextIndex = stepPoints[i + 1].index;
                        const nextAngle = nextIndex * angleStep - Math.PI / 2;
                        const nextX = centerX + radius * Math.cos(nextAngle);
                        const nextY = centerY + radius * Math.sin(nextAngle);
                        
                        // חשב זווית לחץ
                        const dx = nextX - x;
                        const dy = nextY - y;
                        const arrowLength = Math.sqrt(dx * dx + dy * dy);
                        const arrowHeadSize = 10;
                        
                        // צייר קו
                        ctx.beginPath();
                        ctx.moveTo(x, y);
                        ctx.lineTo(nextX, nextY);
                        ctx.stroke();
                        
                        // צייר ראש חץ
                        const angleArrow = Math.atan2(dy, dx);
                        ctx.beginPath();
                        ctx.moveTo(nextX, nextY);
                        ctx.lineTo(
                            nextX - arrowHeadSize * Math.cos(angleArrow - Math.PI / 6),
                            nextY - arrowHeadSize * Math.sin(angleArrow - Math.PI / 6)
                        );
                        ctx.moveTo(nextX, nextY);
                        ctx.lineTo(
                            nextX - arrowHeadSize * Math.cos(angleArrow + Math.PI / 6),
                            nextY - arrowHeadSize * Math.sin(angleArrow + Math.PI / 6)
                        );
                        ctx.stroke();
                    }
                });
                
                ctx.setLineDash([]);
            }
            
            console.log(`Circle graph drawn on ${canvas.id} with ${numbers.length} numbers, stepPoints=`, stepPoints);
        }

        // פונקציה לציור גרף לינארי
        function drawLinearGraph(canvas, values, step, b) {
            const ctx = canvas.getContext('2d');
            if (!ctx) {
                console.error('Failed to get 2D context for canvas:', canvas.id);
                return;
            }
            
            const width = canvas.width;
            const height = canvas.height;
            const margin = 40;
            
            // נקה את הקנבס
            ctx.clearRect(0, 0, width, height);
            
            // צייר רקע
            ctx.fillStyle = '#f7fafc';
            ctx.fillRect(0, 0, width, height);
            
            // חשב ממדים
            const graphWidth = width - 2 * margin;
            const graphHeight = height - 2 * margin;
            const maxX = values.length - 1;
            const maxY = 1;
            
            // צייר צירים
            ctx.beginPath();
            ctx.moveTo(margin, margin);
            ctx.lineTo(margin, height - margin);
            ctx.lineTo(width - margin, height - margin);
            ctx.strokeStyle = '#4a5568';
            ctx.lineWidth = 1;
            ctx.stroke();
            
            // תווית ציר X
            ctx.fillStyle = '#4a5568';
            ctx.font = '12px Arial';
            ctx.textAlign = 'center';
            ctx.fillText('n', width - margin, height - margin + 30);
            
            // תוויות ציר X
            if (maxX >= 0) {
                for (let i = 0; i <= maxX; i++) {
                    const x = margin + (i / (maxX || 1)) * graphWidth;
                    ctx.fillText((i * step).toString(), x, height - margin + 15);
                    
                    // קווי רשת אנכיים
                    ctx.beginPath();
                    ctx.moveTo(x, margin);
                    ctx.lineTo(x, height - margin);
                    ctx.strokeStyle = '#e2e8f0';
                    ctx.lineWidth = 1;
                    ctx.stroke();
                }
            }
            
            // תוויות ציר Y
            ctx.textAlign = 'right';
            for (let i = 0; i <= maxY; i++) {
                const y = height - margin - (i / maxY) * graphHeight;
                ctx.fillText(i.toString(), margin - 5, y + 4);
                
                // קווי רשת אופקיים
                ctx.beginPath();
                ctx.moveTo(margin, y);
                ctx.lineTo(width - margin, y);
                ctx.strokeStyle = '#e2e8f0';
                ctx.lineWidth = 1;
                ctx.stroke();
            }
            
            // צייר קווי דלתא
            if (values.length < 2) {
                console.log('Not enough points to draw lines, rendering single point');
                if (values.length === 1) {
                    const x = margin + graphWidth / 2;
                    const y = height - margin - (values[0] / maxY) * graphHeight;
                    ctx.beginPath();
                    ctx.arc(x, y, 4, 0, 2 * Math.PI);
                    ctx.fillStyle = '#667eea';
                    ctx.fill();
                    ctx.fillStyle = '#2d3748';
                    ctx.font = '12px Arial';
                    ctx.textAlign = 'center';
                    ctx.fillText(values[0].toString(), x, y - 10);
                }
                return;
            }
            
            ctx.strokeStyle = '#667eea';
            ctx.lineWidth = 2;
            ctx.fillStyle = '#667eea';
            
            ctx.beginPath();
            for (let i = 0; i < values.length; i++) {
                const x = margin + (i / maxX) * graphWidth;
                const y = height - margin - (values[i] / maxY) * graphHeight;
                
                // צייר נקודה
                ctx.beginPath();
                ctx.arc(x, y, 4, 0, 2 * Math.PI);
                ctx.fill();
                
                // חבר לקו
                if (i === 0) {
                    ctx.beginPath();
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }
                
                // הצג ערך מעל הנקודה
                ctx.fillStyle = '#2d3748';
                ctx.font = '12px Arial';
                ctx.textAlign = 'center';
                ctx.fillText(values[i].toString(), x, y - 10);
            }
            ctx.strokeStyle = '#667eea';
            ctx.stroke();
            
            console.log(`Linear graph drawn on ${canvas.id} with ${values.length} points`);
        }

        // פונקציה לעדכון מודולו רגיל
        function updateRegularModulo() {
            const a = parseInt(document.getElementById('numA').value) || 5;
            const b = parseInt(document.getElementById('numB').value) || 20;
            
            if (isNaN(a) || isNaN(b) || a < 1 || b < 2) {
                alert('אנא הכנס ערכים תקינים: a ≥ 1, b ≥ 2');
                return;
            }
            
            const result = a % b;
            document.getElementById('regularResultText').textContent = `${result}=(a=${a} mod b=${b})`;
            
            // צור מערך מספרים מ-0 עד b-1
            const numbers = Array.from({length: b}, (_, i) => i);
            const primes = getPrimesUpTo(b - 1);
            
            // צייר את העיגול
            const canvas = document.getElementById('regularCanvas');
            if (!canvas) {
                console.error('Regular canvas not found');
                return;
            }
            drawCircle(canvas, numbers, [result], primes);
            
            // עדכן תצוגת מספרים ראשוניים
            const primesList = document.getElementById('primesList');
            primesList.innerHTML = '';
            primes.forEach(prime => {
                const span = document.createElement('span');
                span.className = 'prime-number';
                span.textContent = prime;
                primesList.appendChild(span);
            });
            console.log('Regular modulo updated with a=', a, 'b=', b);
        }

        // פונקציה לעדכון מודולו עם דלתא
        function updateDeltaModulo() {
            const a = parseInt(document.getElementById('deltaA').value) || 0;
            const b = parseInt(document.getElementById('deltaB').value) || 4;
            const step = parseInt(document.getElementById('deltaStep').value) || 1;
            
            if (isNaN(a) || isNaN(b) || isNaN(step) || a < 0 || b < 1 || step < 1) {
                alert('אנא הכנס ערכים תקינים: a ≥ 0, b ≥ 1, צעד ≥ 1');
                return;
            }
            
            document.getElementById('deltaResultText').textContent = `גרף לינארי: x[n] = δ[n mod ${b}] עבור n = 0, ${step}, ${2*step}, ...; עיגול: δ[(${a} + k·${step}) mod ${b}] עבור k = 0, 1, ..., ${b-1}`;
            
            // צור רצף של תוצאות דלתא לגרף לינארי
            const results = [];
            const numPoints = Math.ceil(3 * b / step);
            for (let i = 0; i < numPoints; i++) {
                const n = i * step;
                const deltaResult = n % b === 0 ? 1 : 0;
                results.push(deltaResult);
            }
            
            // צור רצף של צעדים לגרף עיגול
            const stepPoints = [];
            const highlightedNumbers = [];
            for (let k = 0; k < b; k++) {
                const n = (a + k * step) % b;
                stepPoints.push({ k, index: n });
                if (n === 0) {
                    highlightedNumbers.push(0);
                }
            }
            
            // עדכן רשימת צעדים
            const stepList = document.getElementById('deltaStepList');
            stepList.innerHTML = '';
            stepPoints.forEach(({k, index}) => {
                const div = document.createElement('div');
                div.className = 'step-item';
                div.textContent = `k=${k}: n=${index}`;
                stepList.appendChild(div);
            });
            
            // צור מערך מספרים מ-0 עד b-1
            const numbers = Array.from({length: b}, (_, i) => i);
            const primes = getPrimesUpTo(b - 1);
            
            // צייר את העיגול
            const canvas = document.getElementById('deltaCanvas');
            if (!canvas) {
                console.error('Delta canvas not found');
                return;
            }
            drawCircle(canvas, numbers, highlightedNumbers, primes, stepPoints);
            
            // צייר את הגרף הלינארי
            const linearCanvas = document.getElementById('deltaLinearCanvas');
            if (!linearCanvas) {
                console.error('Delta linear canvas not found');
                return;
            }
            drawLinearGraph(linearCanvas, results, step, b);
            
            console.log('Delta modulo updated with a=', a, 'b=', b, 'step=', step, 'results=', results, 'stepPoints=', stepPoints);
        }

        // אתחול ראשוני
        window.onload = function() {
            console.log('Window loaded, initializing graphs');
            updateRegularModulo();
            updateDeltaModulo();
        };
    </script>
</body>
</html>
