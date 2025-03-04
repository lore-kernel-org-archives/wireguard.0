Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A42C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:25:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1de35eb5;
	Tue, 20 May 2025 19:55:14 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6364d764
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Mar 2025 17:50:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43948021a45so54384635e9.1
 for <wireguard@lists.zx2c4.com>; Tue, 04 Mar 2025 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxpowered-net.20230601.gappssmtp.com; s=20230601; t=1741110614; x=1741715414;
 darn=lists.zx2c4.com; 
 h=autocrypt:subject:from:to:content-language:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VHXjemipVewg+tiuRcJgaURA/VjJSX+vToXQ6OXdLMA=;
 b=bebpz2z0mPJHUI8ociANAGNXZPgNNOy5gv7lcCL3/iM9/wY8TC7HMLLpeeW1CCCJjs
 dSQB45BNE8QwYsSTxXuEHY6Lgttykv3ipTC2afkoHsjaYXRDNwnzoT/0dD5ytS1nNwfW
 P+nxjb0Cx0Kdz48S5oLnvqPKkdzjA7RGYPoqg6KZhGmWaXhq9j/vUX4qP1UX/zPT1vKb
 KFGs4BujvQwFDV7fmFLEPvs/ZJqJrkcAcYZbxZsLlis3j0s+RDGj+vjnQM5MQNot+U24
 YjgSvUFytovNHZQyJRd9GYCwKEo4IpuarjSMhVSlDEXUdn/YJvtahUWUCAeBoC+ml6I+
 3B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741110614; x=1741715414;
 h=autocrypt:subject:from:to:content-language:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHXjemipVewg+tiuRcJgaURA/VjJSX+vToXQ6OXdLMA=;
 b=Y8aq3lO1g2kfRxaVfU4T6dtuVP8h62+jM3MCFdpnoG5FEu49BDbeSCetKWOK21Bt5+
 nJD66RfsY2EMakYVXabEDxcFBftrqrinA8ArcOVYHXiSPNnO5rpp/h5VKE1rb2KwjiyU
 eBh44P50X2cS3TSget5OoZQWc6aE08n3vDk4Qi9YV1QTQw3MqlIXlNtPHBsQGJEBhbGP
 RmuWDC2mC/Yr0qXueDabb5G5WQfUIIU7cfhIV2LKrxFTFGKMuyMjT3iFvSM5t/kBLoQw
 +XVZ+cpXa3OXNTatvkbLt0csnAScB40lKnUzbtL32qCXBTtafUThcoQQBzohOva2F4uN
 Uzig==
X-Gm-Message-State: AOJu0Yxe06j8WEwUGvnN+GxI2g7Ig/rgxD08TvS1tyf95oFlsDOsiShM
 KI2EH8OCxX/aJ5AAu6YQNHv7hJrVDuoWWOCzn/Q51XsXdX00q95Yj8jdqNNTw53ytzMRuCTpnUN
 s
X-Gm-Gg: ASbGnct8jDa6WKhxLYtUdFabLBeQZXoMWe0XihdPptypf++L3sX0Nqt8yXQSHFY2UyR
 Xbsa2jWjfHBvS3ibgr8+E7SzMeLkthdQHIslZJUVq1LlJFDsCbJLmOireo2jlrHTBn/M210WA4X
 DTEasU2nxCLlhfRpIgN7Fx6gMoHiQCVG9JEK3bPeu4w70rEsUmzxUsBb/cPQoxulik7pZ0Dtnu5
 oahxtHyk/Dl+9g5ZwHH1owkQ7tNSmR6MXxvfUKCHROAECWmtfeTS8CrvsZJ0skDI1JaXPJaALNn
 KiVKdPf7d/SV0/lBvq5vzk5sb4sb6MiTTxQRtrBRT8EO9RLEGC6KhH2Vi1NZrEk=
X-Google-Smtp-Source: AGHT+IEiQXhE36lVoFT9pU2HsylbKSNcNyla41Jm0sM+ebCZfuy+NI31BEULj4aoYwok0/wYMLJ2OA==
X-Received: by 2002:a05:6000:1844:b0:390:fe4b:70b9 with SMTP id
 ffacd0b85a97d-390fe4b7820mr12238609f8f.21.1741110613512; 
 Tue, 04 Mar 2025 09:50:13 -0800 (PST)
Received: from [172.17.104.131] ([212.48.107.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc93c8863sm51586595e9.37.2025.03.04.09.50.11
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 09:50:12 -0800 (PST)
Message-ID: <eb08704e-25af-4d98-8493-352098e2865a@tuxpowered.net>
Date: Tue, 4 Mar 2025 18:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
From: Kajetan Staszkiewicz <vegeta@tuxpowered.net>
Subject: [PATCH] Restore iOS-like NWPath handling on MacOS app
Autocrypt: addr=vegeta@tuxpowered.net; keydata=
 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
 Wbiwhrslf0hn78s=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------25V6d222yY0lKul0tnfR0vJ4"
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------25V6d222yY0lKul0tnfR0vJ4
Content-Type: multipart/mixed; boundary="------------DtP4MARC58PfsMVVtqSvEoRt";
 protected-headers="v1"
From: Kajetan Staszkiewicz <vegeta@tuxpowered.net>
To: wireguard@lists.zx2c4.com
Message-ID: <eb08704e-25af-4d98-8493-352098e2865a@tuxpowered.net>
Subject: [PATCH] Restore iOS-like NWPath handling on MacOS app

--------------DtP4MARC58PfsMVVtqSvEoRt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sometimes after a network path change, especially when only "unsatisfied"=

network path is available, for example when a laptop is loses all LAN
and WiFi networks, further network path changes are ignored. When "satisf=
ied"
networks disappear the cloned route for the bound socket is removed by th=
e
system and WireGuard packets are routed through the tunnel. This will res=
ult
in an non-operational tunnel.

The iOS code does not manifest this behaviour, as it properly disables
the tunnel when no "satisfied" networks are available. Remove the special=

MacOS case, use the iOS code on MacOS app.
---
 Sources/WireGuardKit/WireGuardAdapter.swift | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Sources/WireGuardKit/WireGuardAdapter.swift b/Sources/WireGu=
ardKit/WireGuardAdapter.swift
index f7be19b..f5bf115 100644
--- a/Sources/WireGuardKit/WireGuardAdapter.swift
+++ b/Sources/WireGuardKit/WireGuardAdapter.swift
@@ -409,25 +409,20 @@ public class WireGuardAdapter {
                 self.logHandler(.error, "Failed to resolve endpoint \(re=
solutionError.address): \(resolutionError.errorDescription ?? "(nil)")")
             }
         }
     }
=20
     /// Helper method used by network path monitor.
     /// - Parameter path: new network path
     private func didReceivePathUpdate(path: Network.NWPath) {
         self.logHandler(.verbose, "Network change detected with \(path.s=
tatus) route and interface order \(path.availableInterfaces)")
=20
-        #if os(macOS)
-        if case .started(let handle, _) =3D self.state {
-            wgBumpSockets(handle)
-        }
-        #elseif os(iOS)
         switch self.state {
         case .started(let handle, let settingsGenerator):
             if path.status.isSatisfiable {
                 let (wgConfig, resolutionResults) =3D settingsGenerator.=
endpointUapiConfiguration()
                 self.logEndpointResolutionResults(resolutionResults)
=20
                 wgSetConfig(handle, wgConfig)
                 wgDisableSomeRoamingForBrokenMobileSemantics(handle)
                 wgBumpSockets(handle)
             } else {
@@ -453,23 +448,20 @@ public class WireGuardAdapter {
                     settingsGenerator
                 )
             } catch {
                 self.logHandler(.error, "Failed to restart backend: \(er=
ror.localizedDescription)")
             }
=20
         case .stopped:
             // no-op
             break
         }
-        #else
-        #error("Unsupported")
-        #endif
     }
 }
=20
 /// A enum describing WireGuard log levels defined in `api-apple.go`.
 public enum WireGuardLogLevel: Int32 {
     case verbose =3D 0
     case error =3D 1
 }
=20
 private extension Network.NWPath.Status {
--=20
2.47.0



--=20
| pozdrawiam / regards | Powered by macOS, Debian and FreeBSD |
| Kajetan Staszkiewicz |  www: http://vegeta.tuxpowered.net   |
`----------------------^--------------------------------------'


--------------DtP4MARC58PfsMVVtqSvEoRt--

--------------25V6d222yY0lKul0tnfR0vJ4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEfSEIcxY9kDeZvSZsgKrXf6bzAFMFAmfHPVIFAwAAAAAACgkQgKrXf6bzAFO/
lw//Wk8/3LOb7lF2JQngazH19c6lXuSMnIYAzzh4NmQAHsscM1YqJGdKlb8s8hg05JswlhY1jK+F
RujnuLhrioR+bzAMq/zWYbT7rKa8TxVzst9lSKnR9lrTU4T7U/lgwkEhAaQFEXMOdb3J+rRjsDhl
l6y+egHvWc9qDLQT44WrAm1+G4NdiO0I9rB/jv1mbSV/C2xYvlFUlmJjwTAGsLHt6/7cXtHZFT9X
VtWVn4K7sOeimBDAxQVYchPiJDa/wYL9bvjilRxGpxLPTvX8ZQk7D4IlP3ARLLLe/mLuEOmqTbqz
yW7jayuwtESZbTgfMFPEO7pbshmMC3fUls7DyvKNuPCxI2IZEz7zcs9Qn+jK/ihcMSEgrhsDOgfj
mx/zhD84L/Zbq/AciNMX+V9bQjeubzsVuohPNVVPyYRtsqMmLUk1WGWVfy623fuC+zutPrSK6oKV
bCDtM+LHAV77SNYg3Br61kSTXFSyTGnB3dpeM+gA51RKEHXzqDTAXa0o0HK41U7hhWGan+FgzlwM
rVEbOcG6ih+jpj7HvAKuusrA+2O+jw5pl97mINvy6QiE+WIbX0xnjy6r0jNxAdEjbhr57zfAJ1mE
3KvIYZk/iSEiJPSCw3I2uyBIpAnp/6LEnXyycyhywvmDKBzuAYz3jovCgjVBG9r4ejMF+UoDgMdb
u7Y=
=dH/7
-----END PGP SIGNATURE-----

--------------25V6d222yY0lKul0tnfR0vJ4--
