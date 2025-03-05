import React from 'react';

function App() {
  return (
    <div className="min-h-screen bg-background">
      <nav className="bg-primary text-white shadow-lg">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            <div className="flex items-center">
              <span className="text-xl font-semibold">Admin Panel</span>
            </div>
            <div className="flex items-center space-x-4">
              <button className="btn-secondary">
                <i className="fas fa-user mr-2"></i>
                Profile
              </button>
            </div>
          </div>
        </div>
      </nav>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="bg-white rounded-lg shadow-md p-6">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">Welcome to Admin Dashboard</h1>
          <p className="text-gray-600">This is your new admin panel with Tailwind CSS styling.</p>
          
          <div className="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Dashboard Cards */}
            <div className="bg-blue-50 p-6 rounded-lg shadow">
              <div className="flex items-center">
                <i className="fas fa-users text-2xl text-primary"></i>
                <h2 className="ml-3 text-xl font-semibold text-gray-900">Users</h2>
              </div>
              <p className="mt-4 text-gray-600">Manage your users and permissions</p>
            </div>

            <div className="bg-green-50 p-6 rounded-lg shadow">
              <div className="flex items-center">
                <i className="fas fa-chart-bar text-2xl text-green-600"></i>
                <h2 className="ml-3 text-xl font-semibold text-gray-900">Analytics</h2>
              </div>
              <p className="mt-4 text-gray-600">View detailed analytics and reports</p>
            </div>

            <div className="bg-purple-50 p-6 rounded-lg shadow">
              <div className="flex items-center">
                <i className="fas fa-cog text-2xl text-purple-600"></i>
                <h2 className="ml-3 text-xl font-semibold text-gray-900">Settings</h2>
              </div>
              <p className="mt-4 text-gray-600">Configure system settings</p>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}

export default App;
