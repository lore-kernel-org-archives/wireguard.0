Return-Path: flokli@flokli.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1035cc27
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 16:49:12 +0000 (UTC)
Received: from zeus.flokli.de (mail.zeus.flokli.de [88.198.15.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7940171b
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 16:49:12 +0000 (UTC)
Date: Fri, 26 May 2017 19:01:35 +0200
From: Florian Klink <flokli@flokli.de>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: [PATCH] tools: add wireguard@.service
Message-ID: <20170526170135.oxt5l3pegpoo2dow@tp.flokli.de>
References: <20170526084423.31088-1-flokli@flokli.de>
 <87wp93octp.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rlabs3wq6i7rp3kx"
In-Reply-To: <87wp93octp.fsf@fifthhorseman.net>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--rlabs3wq6i7rp3kx
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey dkg,

Once upon a time, Daniel Kahn Gillmor wrote:
>Hi Florian--
>
>On Fri 2017-05-26 10:44:23 +0200, Florian Klink wrote:
>> If you simply want to create wireguard interfaces and configure them,
>> wg-quick might be too much, as it also configures Addresses, MTU and
>> adds routes. This unit file can be used in cases where you want to use
>> wg(8) to configure the wireguard interface, but do regular network
>> configuration on top of the link by something else (possibly not knowing
>> wireguard, like systemd-networkd or NetworkManager.
>
>I like this suggestion, but i see it as a stopgap until there is real
>integration with systemd-networkd -- this would ideally be a .network
>unit just like every other network interface, right?

There is already a pull request to allow systemd-networkd to create
wireguard interfaces and configure wireguard-specific settings on them:
https://github.com/systemd/systemd/pull/4191

This will allow `*.netdev` files with `Kind=3Dwireguard` to be created,
with all the wireguard-specific settings currently defined in
`/etc/wireguard/*.conf` and understood by plain `wg setconf`.

However, this PR will need to wait until wireguard is considered stable:
https://github.com/systemd/systemd/pull/4191#issuecomment-252923968

What currently already works in systemd-networkd is the whole
IP, Route etc. configuration, which is independent of the underlying
wireguard config and done in `*.network` files (man systemd.network).

wg-quick, which already brings systemd unit files, is too much, as it
also adds addresses and routes (in my case, it gets in my way, as I'd
like to set  AllowedIPs to `::/0 and 0.0.0.0/0` but not default route),
but there may also be other cases where you don't need or want the whole
wg-quick.

So as long as support for configuring the underlying wireguard netdev
interface entirely inside systemd-networkd is missing, I'd really favor
a unit file to only configure wireguard-specific parameters.=20

>
>A couple thoughts on the .service file:
>
>> diff --git a/src/tools/wireguard@.service b/src/tools/wireguard@.service
>> new file mode 100644
>> index 0000000..b6d53bf
>> --- /dev/null
>> +++ b/src/tools/wireguard@.service
>> @@ -0,0 +1,19 @@
>> +[Unit]
>> +Description=3DWireGuard via wg(8) for %I
>> +After=3Dnetwork-online.target
>> +Wants=3Dnetwork-online.target
>
>This implies that the network is online *before* the interface comes up.
>That means that other tools which depend on the wireguard link being
>established can no longer depend on network-online.target, right?

Right. This was simply copied from wg-quick@.service. ;-)

These two lines
could probably be replaced by

After=3Dnetwork-pre.target
Wants=3Dnetwork.target

but I'm open to other suggestions :-)

>
>> +Documentation=3Dman:wg(8)
>> +Documentation=3Dhttps://www.wireguard.io/
>> +Documentation=3Dhttps://www.wireguard.io/quickstart/
>> +Documentation=3Dhttps://git.zx2c4.com/WireGuard/about/src/tools/wg.8
>
>I think given the use of the conf file, the [Unit] section should also
>have:
>
>ConditionFileNotEmpty=3D/etc/wireguard/%i.conf

Yes, this might make sense. Not sure if `wg setconf` will fail anyhow,
but failing before creating the interface might be a good idea, thanks :-)

Regards,
flokli

>
>Regards,
>
>        --dkg

--rlabs3wq6i7rp3kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEdQpT8aoDC+ls4wqU86BgVS9TAioFAlkoX2oACgkQ86BgVS9T
AioFVQgAiARls0r9LXYEt2Kp2HgnuI6GGQatBplPXsg4kTa1C9KpI0gp94dPs834
gXBiR/y7DjUY82h6+P63wCHAx1XX3eZEQqWUgOEUFrW6u0N2i5gCOOSHwB73ht7v
bcdH90dqGyEkORzR12t0+FlUTDXHmLgKOp+UOsPetC67AZF6JJv8pJ+gFJD4Ham1
u2zwTTFxBj3H+8ZHgPSeGP+dD8uHIImg76P1x6VgB9XRd5kNc/jYXN6wqto5Q7LX
JN1P8M2hrujBjvkBFvb0ZBeK0LkNTKGYpZRS2XOKEG/pf2u7ZYeZRedLLe9WsaqX
j+6NbU99+XAN+GtfjGDhmxMgKi0Mig==
=fO5M
-----END PGP SIGNATURE-----

--rlabs3wq6i7rp3kx--
