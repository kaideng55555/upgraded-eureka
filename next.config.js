/** @type {import('next').NextConfig} */
const nextConfig = {
  async redirects() {
    return [
      {
        source: '/:path*',
        has: [
          {
            type: 'host',
            value: 'www.dcktoken.com',
          },
        ],
        destination: 'https://dcktoken.com/:path*',
        permanent: true,
      },
    ]
  },
}

module.exports = nextConfig
