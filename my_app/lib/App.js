import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

const API_BASE_URL = process.env.NODE_ENV === 'development' 
  ? 'http://localhost:5000/api' 
  : '/api';

function App() {
  const [activeTab, setActiveTab] = useState('cars');
  const [cars, setCars] = useState([]);
  const [buyers, setBuyers] = useState([]);
  const [sales, setSales] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [newCar, setNewCar] = useState({
    brand: '',
    model: '',
    year: new Date().getFullYear(),
    price: '',
    color: ''
  });

  useEffect(() => {
    fetchData();
  }, [activeTab]);

  const fetchData = async () => {
    try {
      setLoading(true);
      setError(null);
      
      const endpoints = {
        cars: `${API_BASE_URL}/cars`,
        buyers: `${API_BASE_URL}/buyers`,
        sales: `${API_BASE_URL}/sales`
      };

      const response = await axios.get(endpoints[activeTab]);
      
      switch (activeTab) {
        case 'cars':
          setCars(response.data);
          break;
        case 'buyers':
          setBuyers(response.data);
          break;
        case 'sales':
          setSales(response.data);
          break;
        default:
          break;
      }
    } catch (err) {
      console.error('Error fetching data:', err);
      setError('Failed to load data. Please check if backend is running.');
    } finally {
      setLoading(false);
    }
  };

  const handleAddCar = async (e) => {
    e.preventDefault();
    try {
      await axios.post(`${API_BASE_URL}/cars`, newCar);
      setNewCar({ brand: '', model: '', year: new Date().getFullYear(), price: '', color: '' });
      fetchData(); // Refresh the list
    } catch (err) {
      console.error('Error adding car:', err);
      setError('Failed to add car');
    }
  };

  const renderCars = () => (
    <div>
      <h2>Cars Management</h2>
      <div className="add-car-form">
        <h3>Add New Car</h3>
        <form onSubmit={handleAddCar}>
          <input
            type="text"
            placeholder="Brand"
            value={newCar.brand}
            onChange={(e) => setNewCar({...newCar, brand: e.target.value})}
            required
          />
          <input
            type="text"
            placeholder="Model"
            value={newCar.model}
            onChange={(e) => setNewCar({...newCar, model: e.target.value})}
            required
          />
          <input
            type="number"
            placeholder="Year"
            value={newCar.year}
            onChange={(e) => setNewCar({...newCar, year: e.target.value})}
            required
          />
          <input
            type="number"
            placeholder="Price"
            value={newCar.price}
            onChange={(e) => setNewCar({...newCar, price: e.target.value})}
            required
          />
          <input
            type="text"
            placeholder="Color"
            value={newCar.color}
            onChange={(e) => setNewCar({...newCar, color: e.target.value})}
            required
          />
          <button type="submit">Add Car</button>
        </form>
      </div>
      
      <div className="cars-list">
        <h3>Car Inventory</h3>
        {cars.map(car => (
          <div key={car.id} className="car-item">
            <strong>{car.brand} {car.model}</strong>
            <div>Year: {car.year}</div>
            <div>Price: ${car.price}</div>
            <div>Color: {car.color}</div>
            <div>Status: {car.available ? 'Available' : 'Sold'}</div>
          </div>
        ))}
      </div>
    </div>
  );

  const renderBuyers = () => (
    <div>
      <h2>Buyers Management</h2>
      <button className="add-button">Add New Buyer</button>
      <div className="buyers-list">
        {buyers.map(buyer => (
          <div key={buyer.id} className="buyer-item">
            <strong>{buyer.name}</strong>
            <div>Email: {buyer.email}</div>
            <div>Phone: {buyer.phone}</div>
            <div>Address: {buyer.address}</div>
          </div>
        ))}
      </div>
    </div>
  );

  const renderSales = () => (
    <div>
      <h2>Sales Management</h2>
      <button className="add-button">Record New Sale</button>
      <div className="sales-list">
        {sales.map(sale => (
          <div key={sale.id} className="sale-item">
            <strong>Sale #{sale.id}</strong>
            <div>Car: {sale.brand} {sale.model}</div>
            <div>Buyer: {sale.buyer_name}</div>
            <div>Sale Price: ${sale.sale_price}</div>
            <div>Date: {sale.sale_date}</div>
          </div>
        ))}
      </div>
    </div>
  );

  return (
    <div className="App">
      <header className="app-header">
        <h1>Auto Dealer</h1>
        <nav className="main-nav">
          <button 
            className={activeTab === 'cars' ? 'active' : ''}
            onClick={() => setActiveTab('cars')}
          >
            Cars
          </button>
          <button 
            className={activeTab === 'buyers' ? 'active' : ''}
            onClick={() => setActiveTab('buyers')}
          >
            Buyers
          </button>
          <button 
            className={activeTab === 'sales' ? 'active' : ''}
            onClick={() => setActiveTab('sales')}
          >
            Sales
          </button>
        </nav>
      </header>

      <main className="app-main">
        {error && (
          <div className="error-message">
            {error}
            <button onClick={fetchData}>Retry</button>
          </div>
        )}

        {loading ? (
          <div className="loading">Loading...</div>
        ) : (
          <>
            {activeTab === 'cars' && renderCars()}
            {activeTab === 'buyers' && renderBuyers()}
            {activeTab === 'sales' && renderSales()}
          </>
        )}
      </main>

      <footer className="app-footer">
        <p>Auto Dealer Management System © 2024</p>
      </footer>
    </div>
  );
}

export default App;