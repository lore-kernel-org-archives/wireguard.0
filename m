Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a22df03
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 06:54:46 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56ca9716
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 06:54:46 +0000 (UTC)
Date: Sat, 13 May 2017 09:05:34 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Jason@zx2c4.com
Subject: Installation instructions for Debian
Message-ID: <20170513070534.GA22218@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

Could you update the installation instructions for Debian [1]?

Based on the discussion from a few months ago, and given that Wireguard
now supports Jessie's 3.16 kernel, these instructions should be added:

    For Debian jessie or stretch:
    # echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
    # cat <<EOF > /etc/apt/preferences.d/limit-unstable
    Package: *
    Pin: release a=unstable
    Pin-Priority: 200
    EOF
    # apt update
    # apt install wireguard-dkms wireguard-tools

I have verified that the resulting setup is functional (with 0.0.20170421-2 on jessie).

Thanks,
Baptiste

[1] https://www.wireguard.io/install/

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlkWsDkACgkQvgHsIqBO
Lkadxg/9ENVsRfEkjwMNW1z41IiTDSq7+7pRIgdTEXFh3xhf7Gnjkeb/EOsHr29g
jBCfTG89fc3AnnF2jVSSSLHjd0X1ZPRA1tsPecZ8v09Xo6vRfQwzp47aBNiPptg1
AfCcXXyukYmzWKOg4BswrtqZqtoKOaatE+q3AigTQGo969H3siGfe4JVZAE7IBc/
iIPgyYtCrrfQBbLq7b1QwqNjZ+UI0YZpk5sU6z4QwbT1R+45DqDEh4wLDr1qBTvB
g0aiIO7M5KbMOhq8H9S8YMeeFHvchkaUmhVlzl+UNIdnQjKM+MPPo5X+XzLT6Yd6
wKdvWWIML4JG8Z0f5KDyj3uHzjDIJxtBG0YbYykYJW2BQURHdaVzsqqYgGLYaod+
kMOqGOvrZi7A9JWDbJWCyAKYWYC2XEihZ3LWnEFwyn/Dwjp3kivnIQ21VoxrmwXW
u/GiOi+gHSV5TCSxogDwaOmt5zZJKC41ZpT7/rfgnyg5nl4CngGu8I5nbL0C+WBb
P33/yFmiW7ssnoENrgU+YW9ktaikwwkpu83MJgl1K1NWTt7CWilw3ypl+3eoMn5C
L1cHHKHNQzqxFBy2mrXJoODAuptJ6U4Kaha8FBIMBmL/ZkId6SQM1Gaa1XBt5ZCM
9JuZIPAATP3OCZ0i/pg7KTfx/T2evXmOZ2OMi1iFQZs9laDMiHI=
=5lmg
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
