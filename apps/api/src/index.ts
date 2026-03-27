import jokeRoutes from './routes/jokes';

// Add with your other routes (around line where other routes are imported):
app.use('/api/jokes', jokeRoutes);
