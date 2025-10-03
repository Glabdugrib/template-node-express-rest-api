import express from 'express';
import helloRouter from './routes/hello';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use('/api', helloRouter);

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
});
