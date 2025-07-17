import React from 'react';

function Spinner() {
    return (
        <div>
            <div className="spinner"></div>
            <p style={{ textAlign: 'center', marginTop: '1rem', fontSize: '0.9rem', color: '#6b7280' }}>
                Processing your data... Fake address detection may take longer.
            </p>
        </div>
    );
}

export default Spinner;