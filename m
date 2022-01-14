Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D99C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jan 2022 21:15:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3ad64c1d;
	Sun, 16 Jan 2022 21:10:56 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d69d7cdf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jan 2022 19:43:22 +0000 (UTC)
Received: from oxuslxaltgw13.schlund.de ([10.72.76.69]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0MRWGM-1mkEZE1oNM-00SfE1
 for <wireguard@lists.zx2c4.com>; Fri, 14 Jan 2022 20:43:20 +0100
Date: Fri, 14 Jan 2022 14:43:19 -0500 (EST)
From: Alejandro Pablo Achterberg <aachterberg@emtech.com.ar>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <1138419590.64184.1642189399873@email.ionos.com>
Subject: wintun 0.13 driver - performance issue
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.5-Rev34
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:nJNkVciIck+3NznUM5y0kuv3z4XFCUl5aABl0eqkFWNvXwA3Z1w
 bm5+1aMKiEYGWSE0y0uLN42p3BarhqaYnNl9fJjKRKOFDWQlXwld9u8pqzuZOO8fUZeJCv5
 YhL8S2Rr0kj/S2hjKjjNEIGtBxu12j148hS8znawdIRap7AxxewJ/YZDwLAXeJ21HZd6XLI
 YzX0WA5D4NoO3Pn3PHx4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vGKJPuu2hTI=:EyPFGJwgONgJASD4Whe4eO
 PGhhVwDjhpYYYNIiO/a1v1nlbX98nT2sJgEqfS8Ow+90oGaylPj+1r1r+qfdHImfyWY9yrA+d
 C3ZAryyi5Sk/iaekmGW9y5CIlcZi/qOGIFEJLOAtgm0aiCWoK+FDIGiOv0LDMRylNgPFS5jL5
 3RdqSb25gkyhp/xL0Qwa/U4+3QKqR53nLmfBnRYYGQccab9iUIzJpsPJxThVWwofVORH1M6JD
 ciwBJtivXWbC6/SgeMGzn2+gNUhUInh4iB/BHVFHDx5XEtHS19YTpTuN7sITGTyhH9BgpgXnR
 56xSefVot33na7BaUqJirhcBzDA+wzHusX82xpAD3OEUNQMU0yqDCZjC2arXW/XSQvONLxBr7
 K3B/i9GgkQYTy568hXvpJgqJrcOPeHZqGJXDVbK/ZkNCOR5c+fN/O0/WtLkFgF6fvu11QLs+/
 m/fVSE+wbfIbtGGj+55Ljbk5YpTHHVXzUEpzjt6drYR7YuDVLZ0sjO3rkAgjldnbmQ0A5+0lD
 B4r3wUASUfENH31y9UfreK+KlvPCUPCHxN6JdDuNX6qryPYWhV2nOEtvh1IqSueodBFT5WKvm
 j4Kj57iflrKOOhbS2ZV6VsGHjB+Kq6MzfbZ33z7O3JmuTisb23zqgMEs5tLdf9TAHDPeme6PF
 7HbiYWBFSfSoonXKwGRcEoEN4hk4xALYTRPtelaurOuCsaE71hZsdmdndsp7RGhO3J3D4CoxZ
 Zra57eQc6+9PC73u
X-Mailman-Approved-At: Sun, 16 Jan 2022 21:10:46 +0000
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

Hi everyone !
I have this issue to share to see if it can be considered a natural limitation of the implementation or (more probably) that I am making some bad decisions.
I modified the example.c included in wintun-0.13 code to test higher rates of packet sending.
I am building Multicast UDP packets 200 bytes long that are received at a consumer application -that opens a socket to the wintun adapter registering the multicast group to the socket-.
I turned off all console logging during the test run.
I'm running on a Windows Server 2019, 8 cores, 32 GB RAM, Visual Studio Community 2019.
What I get is that the example can send the 100 Kpps (and up to ~300 Kpps) without problems, but not with the consumer application reading packets from the wintun adapter.
When the consumer application is reading packets from the wintun interface the top sending rate falls about 15-20%.
It keeps below 85 Kpps and shows some events of problems at WintunAllocateSendPacket(). I set the Rings capacity to the MAX allowed of 64 MB.
Trying to fix this behaviour I modified the ERROR_BUFFER_OVERFLOW error handling doing a wait on the Alertable state of the Receive Ring and settting the Receive.Tailmoved event when that happens.
This is the SendPackets() method:
static DWORD WINAPI
SendPackets(_Inout_ DWORD_PTR SessionPtr)
{
TUN_SESSION* Session = (TUN_SESSION*)SessionPtr;
while (!HaveQuit)
{
BYTE* Packet = WintunAllocateSendPacket(Session, 228);
if (Packet)
{
MakeIpPacket(Packet);
WintunSendPacket(Session, Packet);
++sentPkts;
spin(RATE, PPS);
}
else {
if (GetLastError() != ERROR_BUFFER_OVERFLOW) {
return LogLastError(L"Packet write failed");
}
else {
while (Session->Descriptor.Receive.Ring->Alertable != 1) {
spin(1000, FALSE);
}
SetEvent(Session->Descriptor.Receive.TailMoved);
++sendDelay;
}
}
}
return ERROR_SUCCESS;
}
and this is my spin() function:
// Packets per second sent can be defined as PPS using windows timers or with their period using a count loop
static boolean PPS = TRUE;
static LONG RATE = 115000;
static void
spin(LONGLONG rate, boolean isPPS) {
LARGE_INTEGER StartingTime, CurrentTime, ElapsedMicroseconds;
LONGLONG nano;
if (isPPS) {
nano = 1e9 / rate;
QueryPerformanceCounter(&StartingTime);
while (TRUE) {
if (HaveQuit)
break;
QueryPerformanceCounter(&CurrentTime);
ElapsedMicroseconds.QuadPart = CurrentTime.QuadPart - StartingTime.QuadPart;
ElapsedMicroseconds.QuadPart *= 1000000; // guard against loss-of-precision
ElapsedMicroseconds.QuadPart /= Frequency.QuadPart;
ElapsedMicroseconds.QuadPart *= 1000; // nanoseconds
if (nano < ElapsedMicroseconds.QuadPart) {
break;
}
}
}
else {
if (rate < 1000) {
return;
}
nano = rate;
while (nano > 0) {
if (HaveQuit)
break;
--nano;
}
}
}
Statistics reported look like this when sending to the wintun interface and without the consumer application active.
Rate of 100 Kpps is easily reached.
"Delayed" counts are ERROR_BUFFER_OVERFLOW events from WintunAllocateSendPacket().
> .\wintunprj.exe
2022-01-11 21:09:19.0371 [+] Wintun library loaded
2022-01-11 21:09:19.0377 [+] WintunCreateAdapter: Creating adapter
2022-01-11 21:09:19.0477 [+] SelectDriver: Using existing driver 0.13
2022-01-11 21:09:19.0757 [+] Wintun v0.13 loaded
2022-01-11 21:09:19.0762 [+] Starting -----------------------------
2022-01-11 21:09:19.0774 [+] Run started with PPS: 115000
2022-01-11 21:09:26.0764 [+] Elapsed time in seconds: 6.985698
2022-01-11 21:09:26.0766 [+] 757111 packets sent, 42 packets received
2022-01-11 21:09:26.0768 [+] Packets sent at 108380 pps
2022-01-11 21:09:26.0769 [+] Final Sending problem counts - delayed: 0
And the statistics look like this with the consumer application active.
Packet rate drops to 84 Kpps.
Delayed events are present but they don't look significant actually...
.\wintunprj.exe
2022-01-11 21:33:22.0198 [+] Wintun library loaded
2022-01-11 21:33:22.0204 [+] WintunCreateAdapter: Creating adapter
2022-01-11 21:33:22.0282 [+] SelectDriver: Using existing driver 0.13
2022-01-11 21:33:22.0564 [+] Wintun v0.13 loaded
2022-01-11 21:33:22.0576 [+] Starting -----------------------------
2022-01-11 21:33:22.0594 [+] Run started with PPS: 115000
2022-01-11 21:34:39.0068 [+] Elapsed time in seconds: 76.470261
2022-01-11 21:34:39.0070 [+] 6455902 packets sent, 45 packets received
2022-01-11 21:34:39.0072 [+] Packets sent at 84424 pps
2022-01-11 21:34:39.0074 [+] Final Sending problem counts - delayed: 5
Any thoughts or ideas on how is this happening and changes due will be really appreciated !
Thanks,
Alex
