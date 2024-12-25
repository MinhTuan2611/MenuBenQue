using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MenuBenQue.Migrations
{
    public partial class updatemodel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "NhomChaNhomId",
                table: "NhomMonAn",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "GhiChu",
                table: "MonAns",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsCombo",
                table: "MonAns",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "MatMa",
                table: "MonAns",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "MonAnMonId",
                table: "MonAns",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn",
                column: "NhomChaNhomId");

            migrationBuilder.CreateIndex(
                name: "IX_MonAns_MonAnMonId",
                table: "MonAns",
                column: "MonAnMonId");

            migrationBuilder.AddForeignKey(
                name: "FK_MonAns_MonAns_MonAnMonId",
                table: "MonAns",
                column: "MonAnMonId",
                principalTable: "MonAns",
                principalColumn: "MonId");

            migrationBuilder.AddForeignKey(
                name: "FK_NhomMonAn_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn",
                column: "NhomChaNhomId",
                principalTable: "NhomMonAn",
                principalColumn: "NhomId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MonAns_MonAns_MonAnMonId",
                table: "MonAns");

            migrationBuilder.DropForeignKey(
                name: "FK_NhomMonAn_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn");

            migrationBuilder.DropIndex(
                name: "IX_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn");

            migrationBuilder.DropIndex(
                name: "IX_MonAns_MonAnMonId",
                table: "MonAns");

            migrationBuilder.DropColumn(
                name: "NhomChaNhomId",
                table: "NhomMonAn");

            migrationBuilder.DropColumn(
                name: "GhiChu",
                table: "MonAns");

            migrationBuilder.DropColumn(
                name: "IsCombo",
                table: "MonAns");

            migrationBuilder.DropColumn(
                name: "MatMa",
                table: "MonAns");

            migrationBuilder.DropColumn(
                name: "MonAnMonId",
                table: "MonAns");
        }
    }
}
