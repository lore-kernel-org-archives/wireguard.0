Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97cd4984
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:35:56 +0000 (UTC)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ee4d0ee
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:35:56 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w64so5102670wma.0
 for <wireguard@lists.zx2c4.com>; Thu, 04 May 2017 11:45:45 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.52] (uk.webcrumb.net. [176.126.241.16])
 by smtp.googlemail.com with ESMTPSA id j71sm2654917wmd.12.2017.05.04.11.45.43
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2017 11:45:43 -0700 (PDT)
Subject: Re: Specifying the source port
To: wireguard@lists.zx2c4.com
References: <CAM3m09RKuXF=HkvGFpH3=VxW2PvqDx2BpB3yfLkMcZgLhm_X9w@mail.gmail.com>
 <CAHmME9p0L8WjCvcrtk+8AeOxmnExSK5YhnCcNbYmxmp_Yc_ejg@mail.gmail.com>
 <CAHmME9oeaMNrbN1Eek=0p7xR54oCZgBRVjnR-UgcQAoPaJczGQ@mail.gmail.com>
 <CAM3m09QjwL9cyU66VXA0B8o88BcMiqTXm5Qhp-DKkaYu_A8PfA@mail.gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <ee7f8d04-a971-968b-44fb-4497c7f346a1@york.ac.uk>
Date: Thu, 4 May 2017 19:45:36 +0100
MIME-Version: 1.0
In-Reply-To: <CAM3m09QjwL9cyU66VXA0B8o88BcMiqTXm5Qhp-DKkaYu_A8PfA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DrQfH11t3xmaMsXRAhL8kNaSsWNpuISDX"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DrQfH11t3xmaMsXRAhL8kNaSsWNpuISDX
Content-Type: multipart/mixed; boundary="cN9nDHQbkci6ga15oknQPkDnT8rqPstGK";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <ee7f8d04-a971-968b-44fb-4497c7f346a1@york.ac.uk>
Subject: Re: Specifying the source port
References: <CAM3m09RKuXF=HkvGFpH3=VxW2PvqDx2BpB3yfLkMcZgLhm_X9w@mail.gmail.com>
 <CAHmME9p0L8WjCvcrtk+8AeOxmnExSK5YhnCcNbYmxmp_Yc_ejg@mail.gmail.com>
 <CAHmME9oeaMNrbN1Eek=0p7xR54oCZgBRVjnR-UgcQAoPaJczGQ@mail.gmail.com>
 <CAM3m09QjwL9cyU66VXA0B8o88BcMiqTXm5Qhp-DKkaYu_A8PfA@mail.gmail.com>
In-Reply-To: <CAM3m09QjwL9cyU66VXA0B8o88BcMiqTXm5Qhp-DKkaYu_A8PfA@mail.gmail.com>

--cN9nDHQbkci6ga15oknQPkDnT8rqPstGK
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 04/05/17 19:41, Ryan Whelan wrote:
> How do I set the src port for peer 'B' so all traffic from B will come =
from a predicable source port?

I don't think that's how network stacks work... ?


--cN9nDHQbkci6ga15oknQPkDnT8rqPstGK--

--DrQfH11t3xmaMsXRAhL8kNaSsWNpuISDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAlkLdtYACgkQ4DBDgow/
9LscwQ//dlW5vNlMgrNuNbVDRZYfATfcuffnhYCD6CYfQZ6TilMpSBwC1ZnpLm3R
NAXPqvbJGDLOXYtS3s885PHe3UXNaUWS8dqCKFP+tqmDqPVIVryuqKAsvDK+A39A
6mCBlVbqEYOpg1ml+H5JfvellkAJDb5tnFL2xHyHQCLqOJlMgvlqW03D8j7/m+4L
fXPorVAoaQSLCfY6dyXp2U/Rhxk8EMP6YaWxG3D1dbFD26/WNWOpexO2OYVuIZYs
hZ/HI3Y6pwPJMr/lLWSqfdjuk+G+td3KyYNMVD5Yd3FIsW13F7+CdmobZSGWmtgy
eDG8znL8KQYP67U7oDZ/ohzkGNPcrgXrsTBSe3VZd9EajneSPSeTPCwUwVJ47y5H
gIGtMHv9qh33U2DYrYpdgcirkE7mH1VdTjKCO1IcRMX59ci19mubyYX8be7WXtlo
SVpiN4JFJWLQmGh5Ax6pRV8GFDSvWoLVQQwRFj+Kw3lTs7fpGwXQNzdeXShlviDB
ZtF+I3LztYOCL9i5R3hAdMycie5ljQhb/UQy8YiykM6zjLfz2KzU/EBV1fQqmLLs
O9dxU7qARK6WzrN+D5+ygGD/IuG/GITaxTCnyOrPAJRZqCMGmML+99zmK7Q5tDvs
+y3QciCW09mK3eMbsyeyeVU7DNW3lcvLa03A0QyGSFMWuA3nXsw=
=icRH
-----END PGP SIGNATURE-----

--DrQfH11t3xmaMsXRAhL8kNaSsWNpuISDX--
