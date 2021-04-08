Return-Path: <SRS0=g8VQ=JF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC1CC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 14:37:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10BB60FF1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 14:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10BB60FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6d7f808;
	Thu, 8 Apr 2021 14:37:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d887ffe5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4iDPbiXpUUYHY7GfRAKKjkX/ZggoMtF5verDaj8fJC0=; b=qmIP3gDgyk30BnOX3JZZmqOJ9c
 NBOBh2eSpxU+NAS6f6it1hGVZloX5sXtBrwQkH+symx9RF0Ej8irTtN89eXnl0oTf7ZA/sKbpaD+7
 24dIB7SeLnHhu+GmEJpHw3iDTIzyuHcgMdoDhbkZIdQv4aR+7DBSAiegc9QxPVAp1EUOtnOXLp65J
 D2KvqTnpJwcs02//VTqpBLwptnuT/yc4UED3HxlpCsksJUddbWhv8Rj+1UI1nEicHS7GnbUAAhBZf
 hUXi0LWjQZEJjMcE8FWvLOSCnfaeHFT2m1oe3xBl8aP6h7cu5gUKjt4KvlLDqP+nBUJi8U2V6UHh9
 1xiZJBtA==;
Received: from dyn-234.woodhou.se ([90.155.92.234])
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUVmV-008GY1-NX; Thu, 08 Apr 2021 14:37:16 +0000
Message-ID: <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
Subject: Re: Allowing space for packet headers in Wintun Tx/Rx
From: David Woodhouse <dwmw2@infradead.org>
To: Daniel Lenski <dlenski@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 08 Apr 2021 15:37:15 +0100
In-Reply-To: <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/x-pkcs7-signature";
 boundary="=-j9MqDXlLfH2+Cq9qTFZE"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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


--=-j9MqDXlLfH2+Cq9qTFZE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-07 at 16:15 -0700, Daniel Lenski wrote:
> On Wed, Apr 7, 2021 at 4:49 AM David Woodhouse <dwmw2@infradead.org> wrot=
e:
> > If WintunSendPacket took an additional 'offset' argument to disregard a
> > certain number of bytes at the beginning of the buffer, that would
> > probably suffice. Or is it possible to simply add to the pointer
> > returned by WintunAllocateSendPacket()?
>=20
> To expand on this possibility a little bit, I had proposed kludging a
> =E2=80=9Cshift=E2=80=9D into the allocation for the outgoing packet:
>=20
>     /* Always use this instead for an outgoing packet, instead of
>      * malloc(sizeof(struct pkt) + payload_len */
>     BYTE *tun_pkt =3D WintunAllocateSendPacket(
>         vpninfo->wintun_session,
>         paylod_len                 /* packet payload size */
>         + sizeof(struct pkt)     /* OpenConnect's internal packet header =
size */
>     );
>=20
>     /* Then after we build and populate the outgoing packet, just tell
>      * Wintun to send from an offset that's NOT at the beginning of the
>      * buffer it allocated for us. No memcpy! */
>     WintunSendPacket(vpninfo->wintun_session, tun_pkt + sizeof(struct pkt=
));
>=20
> The concern here is that Wintun may not have been written with this
> possibility in mind, and might not always like sending from an address
> other than the exact start of a buffer it's allocated for us.

If we have to, we could probably ditch a lot of what's in the DLL's
api/session.c and manage the ring for ourselves; the fundamental
limitation right now is how the kernel driver itself handles the shared
ring.

It uses a TUN_PACKET header which is basically just a 'ULONG Size'
followed immediately by the data. To allow the application to process
packets out-of-order, the *userspace* part sets the top bit of ->Size
to manage ownership between the DLL and the application, but the kernel
side doesn't see that because it's removed by the time the DLL bumps
the ring tail to allow the kernel to see the packet.

For OpenConnect I think it's reasonable to declare that we don't care
about optimising the TCP fallback data path; it's the UDP data path
that we really want to be zero-copy, decrypting directly into the tun
ring and encrypting directly from it.

Let's take a look at the protocols we need to support...
=20
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 Cisco DTLS
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Cisco DTLS has only a single byte of header, for the packet type.

So for VPN=E2=86=92tun traffic we could actually just receive the packet (w=
ith
gnutls_record_recv() or ssl_read()) directly into the TUN ring, with
the first byte *overwriting* the MSB of the Size field of the
TUN_HEADER.

If it's a packet type of anything other than AC_PKT_DATA we'd then
handle it immediately (as we do now) and end up re-using the same
location in the ring next time. If it's AC_PKT_DATA we just reinstate
the Size field of the header and bump the ring Tail to let the kernel
see it. If it wasn't for the fact that we need to allocate the full
possible MTU and then reduce the actual packet size once we see it,
this would even be compatible with the existing ring management in
wintun.dll. It's certainly compatible with the kernel driver.

For tun=E2=86=92VPN traffic we can do something similar, abusing that top b=
yte
of the Size field. And this *would* be compatible with the existing
DLL, since we know that byte is going to be zero (which is AC_PKT_DATA)
anyway. (Here's where it would be nice to have gnutls_record_sendv() or
SSL_writev() methods which do scatter/gather, but we don't).

The bare minimum we need from Wintun here is a function that would
resize the last allocated send packet. As long as nothing has been
allocated *after* it, we could reduce its size and adjust
Session->Receive.Tail accordingly.

 =3D=3D=3D
 ESP
 =3D=3D=3D

For ESP we do our own encrypt/decrypt operations directly and don't
need a header. But we do actually need a *tail*, since the packet is
padded to the crypto block size and has a 'next header' field in the
final encrypted byte, e.g:

   DD DD DD DD DD DD DD DD  DD DD DD DD DD DD DD DD
   DD DD DD 01 02 03 04 05  06 07 08 09 0a 0b 0b 29
            <........... padding ..........>  =E2=86=91  =E2=86=91
                                         padlen  next_hdr
 =20
So, much as with Cisco DTLS for VPN=E2=86=92tun traffic we'd want to alloca=
te
*more* space in the Wintun ring than we actually need, then shrink the
Size field later to match precisely the size of the packet. Which again
is compatible with the kernel driver but not with the ring management
currently in api/session.c.

For tun=E2=86=92VPN traffic it's a little more complex as we ideally want t=
he
kernel driver to leave space *after* the packet, for us to append the
tail bytes without scribbling over the subsequent packet in the ring.

But it isn't the end of the world; we can encrypt *most* of the packet
directly from the tun ring, and we only need to copy *less* than a
single crypto block (those first three DD DD DD bytes in the final line
of the above example) into a buffer elsewhere to handle the padding
etc.


 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 PPP over DTLS
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We just added support for the PPP-based protocols (Fortinet, F5) and
I'm not sure we even know what the DTLS-based version looks like on the
wire, do we? If the header is 4 bytes or fewer, the same nasty trick
works that I suggest for Cisco DTLS above. And a PPP header even with
accomp and pfcomp *would* fit in 4 bytes. For the TCP transports we
have an additional framing but I'm hoping those aren't there in DTLS?

If we do need a header larger than 4 bytes, then we are forced to do
things properly by adding support in the kernel driver instead of just
abusing the existing header while we know the kernel isn't looking at
it.



So, what do we want, and what's the bare minimum we actually *need*
from Wintun to be able to avoid those memcpys?=20

The bare minimum is either exposing enough of the TUN_SESSION to let us
manage the rings for ourselves, or a function which can resize the
*last* allocated packet from the Tx ring before we call
WintunSendPacket() on it. That's purely userspace in wintun.dll.

The next request would be to expand the TUN_HEADER to include head/tail
space, and a parameter in the TUN_REGISTER_RINGS structure which
configures the amount of head/tail space to leave between received
packets. That's a change in the kernel API and is more complex to
manage, and as noted we *could* live without it for now although it's
kind of ugly, still involves *some* copying at the tail of outbound ESP
packets, and depends on those PPP headers not exceeding the 4 bytes
that are currently available for us to abuse :)



--=-j9MqDXlLfH2+Cq9qTFZE
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEw
NDA4MTQzNzE1WjAvBgkqhkiG9w0BCQQxIgQgiNJlsQZxaROCLpKghIux66Z/Bdm92qJFeEZfZ+qa
OnQwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAG8o28XUYelS5zxV1AtyAefYoYne5veD83w8SLtyEiz+oQA9aF6ffm9q+/O4fFJA
kbWkUCJ98nv6Dntuk1JBL3o4OlQUcrPGUgl6pSxXwxcswakfhyEUWCquJepH6Xe7yw6Cbi4qsa2R
1rD27RR+EKnpMkvB3jVO0LnMg5y//o8fsCtMRZ5//MGbBS5NisU00ACtWlIcbRhNWZj9+w5vUBur
AZJZ7yTYNBv8mCeaLq16alpoKpRrUfetenOIYdbnvaUM5L/MG+QSI5tJTXgtUg7jSf9/7qy0ECIm
DNWLMRftcMVAVw3SKgPoHq5BevZc12pLJzv2haNI5ZnI3KwFbDAAAAAAAAA=


--=-j9MqDXlLfH2+Cq9qTFZE--

